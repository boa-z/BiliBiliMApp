//
//  NJSponsorBlockService.m
//  BiliBiliMDDylib
//

#import "NJSponsorBlockService.h"
#import "NJSponsorBlockSegment.h"
#import "NJSponsorBlockSettings.h"
#import <math.h>

static NSString * const NJSponsorBlockUserIDKey = @"NJSponsorBlockVoteUserIDKey";
static NSString * const NJSponsorBlockServiceErrorDomain = @"NJSponsorBlockService";

@interface NJSponsorBlockService ()

- (NSMutableURLRequest *)sponsorBlockRequestWithURL:(NSURL *)url method:(NSString *)method timeout:(NSTimeInterval)timeout;
- (NSURL *)requestURLWithVideoID:(NSString *)videoID cid:(NSInteger)cid categories:(NSArray<NSString *> *)categories;
- (NSURL *)viewedSegmentURLWithUUID:(NSString *)uuid;
- (NSURL *)voteURLWithUUID:(NSString *)uuid type:(NSInteger)type;
- (NSURL *)submitURL;
- (NSString *)sponsorBlockUserID;
- (NSError *)errorWithCode:(NSInteger)code message:(NSString *)message;
- (BOOL)timeNumbersAreValid:(NSArray<NSNumber *> *)segment;

@end

@implementation NJSponsorBlockService

- (void)fetchSegmentsWithVideoID:(NSString *)videoID
                             cid:(NSInteger)cid
                      categories:(NSArray<NSString *> *)categories
                      completion:(NJSponsorBlockSegmentsCompletion)completion {
    if (videoID.length == 0 || cid <= 0) {
        if (completion) {
            completion(@[], nil);
        }
        return;
    }
    
    NSURL *url = [self requestURLWithVideoID:videoID cid:cid categories:categories];
    if (!url) {
        if (completion) {
            NSError *error = [NSError errorWithDomain:@"NJSponsorBlockService"
                                                 code:-1
                                             userInfo:@{NSLocalizedDescriptionKey: @"Invalid SponsorBlock URL"}];
            completion(@[], error);
        }
        return;
    }
    
    NSMutableURLRequest *request = [self sponsorBlockRequestWithURL:url method:@"GET" timeout:8];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            if (completion) {
                completion(@[], error);
            }
            return;
        }
        
        if (data.length == 0) {
            if (completion) {
                completion(@[], nil);
            }
            return;
        }
        
        NSError *jsonError = nil;
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            if (completion) {
                completion(@[], jsonError);
            }
            return;
        }
        
        NSArray *items = [json isKindOfClass:[NSArray class]] ? json : @[];
        NSMutableArray<NJSponsorBlockSegment *> *segments = [NSMutableArray array];
        for (NSDictionary *item in items) {
            NJSponsorBlockSegment *segment = [NJSponsorBlockSegment segmentWithDictionary:item];
            if (!segment) {
                continue;
            }
            if (segment.actionType.length > 0 &&
                ![segment.actionType isEqualToString:@"skip"] &&
                ![segment.actionType isEqualToString:@"poi"] &&
                ![segment.actionType isEqualToString:@"full"]) {
                continue;
            }
            [segments addObject:segment];
        }
        
        [segments sortUsingComparator:^NSComparisonResult(NJSponsorBlockSegment *obj1, NJSponsorBlockSegment *obj2) {
            if (obj1.startTime < obj2.startTime) {
                return NSOrderedAscending;
            }
            if (obj1.startTime > obj2.startTime) {
                return NSOrderedDescending;
            }
            return NSOrderedSame;
        }];
        
        if (completion) {
            completion([segments copy], nil);
        }
    }];
    [task resume];
}

- (void)reportViewedSegmentWithUUID:(NSString *)uuid {
    if (uuid.length == 0) {
        return;
    }

    NSURL *url = [self viewedSegmentURLWithUUID:uuid];
    if (!url) {
        return;
    }

    NSMutableURLRequest *request = [self sponsorBlockRequestWithURL:url method:@"POST" timeout:5];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(__unused NSData *data, __unused NSURLResponse *response, NSError *error) {
        if (error) {
            NSLog(@"[NJSponsorBlock] report viewed segment failed: %@", error);
        }
    }];
    [task resume];
}

- (void)voteForSegmentWithUUID:(NSString *)uuid type:(NSInteger)type completion:(NJSponsorBlockVoteCompletion)completion {
    if (uuid.length == 0 || (type != 0 && type != 1)) {
        if (completion) {
            NSError *error = [NSError errorWithDomain:@"NJSponsorBlockService"
                                                 code:-2
                                             userInfo:@{NSLocalizedDescriptionKey: @"Invalid SponsorBlock vote"}];
            completion(NO, error);
        }
        return;
    }

    NSURL *url = [self voteURLWithUUID:uuid type:type];
    if (!url) {
        if (completion) {
            NSError *error = [NSError errorWithDomain:@"NJSponsorBlockService"
                                                 code:-1
                                             userInfo:@{NSLocalizedDescriptionKey: @"Invalid SponsorBlock vote URL"}];
            completion(NO, error);
        }
        return;
    }

    NSMutableURLRequest *request = [self sponsorBlockRequestWithURL:url method:@"POST" timeout:8];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(__unused NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            if (completion) {
                completion(NO, error);
            }
            return;
        }

        NSHTTPURLResponse *httpResponse = [response isKindOfClass:[NSHTTPURLResponse class]] ? (NSHTTPURLResponse *)response : nil;
        BOOL success = httpResponse.statusCode >= 200 && httpResponse.statusCode < 300;
        if (completion) {
            NSError *statusError = nil;
            if (!success) {
                statusError = [NSError errorWithDomain:@"NJSponsorBlockService"
                                                   code:httpResponse.statusCode
                                               userInfo:@{NSLocalizedDescriptionKey: @"SponsorBlock vote failed"}];
            }
            completion(success, statusError);
        }
    }];
    [task resume];
}

- (void)submitSegmentWithVideoID:(NSString *)videoID
                             cid:(NSInteger)cid
                        category:(NSString *)category
                      actionType:(NSString *)actionType
                         segment:(NSArray<NSNumber *> *)segment
                   videoDuration:(NSTimeInterval)videoDuration
                      completion:(NJSponsorBlockSubmitCompletion)completion {
    BOOL poiAction = [actionType isEqualToString:@"poi"];
    BOOL skipAction = [actionType isEqualToString:@"skip"];
    if (videoID.length == 0 || cid <= 0 || category.length == 0 || (!poiAction && !skipAction) ||
        (poiAction && segment.count != 1) || (skipAction && segment.count != 2) ||
        ![self timeNumbersAreValid:segment] || videoDuration <= 0 || !isfinite(videoDuration)) {
        if (completion) {
            completion(NO, [self errorWithCode:-2 message:@"Invalid SponsorBlock submission"]);
        }
        return;
    }

    NSURL *url = [self submitURL];
    if (!url) {
        if (completion) {
            completion(NO, [self errorWithCode:-1 message:@"Invalid SponsorBlock submit URL"]);
        }
        return;
    }

    NSDictionary *segmentObject = @{
        @"segment": segment,
        @"UUID": NSUUID.UUID.UUIDString,
        @"category": category,
        @"actionType": actionType,
    };
    NSDictionary *body = @{
        @"videoID": videoID,
        @"cid": @(cid),
        @"userID": [self sponsorBlockUserID],
        @"segments": @[segmentObject],
        @"videoDuration": @(videoDuration),
        @"userAgent": @"BiliBiliMApp/1.0",
    };

    NSError *jsonError = nil;
    NSData *bodyData = [NSJSONSerialization dataWithJSONObject:body options:0 error:&jsonError];
    if (!bodyData || jsonError) {
        if (completion) {
            completion(NO, jsonError ?: [self errorWithCode:-3 message:@"Invalid SponsorBlock submit body"]);
        }
        return;
    }

    NSMutableURLRequest *request = [self sponsorBlockRequestWithURL:url method:@"POST" timeout:10];
    request.HTTPBody = bodyData;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error) {
            if (completion) {
                completion(NO, error);
            }
            return;
        }

        NSHTTPURLResponse *httpResponse = [response isKindOfClass:[NSHTTPURLResponse class]] ? (NSHTTPURLResponse *)response : nil;
        BOOL success = httpResponse.statusCode >= 200 && httpResponse.statusCode < 300;
        if (completion) {
            NSError *statusError = nil;
            if (!success) {
                NSString *message = @"SponsorBlock submit failed";
                if (data.length > 0) {
                    NSString *responseText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                    if (responseText.length > 0) {
                        message = responseText;
                    }
                }
                statusError = [self errorWithCode:httpResponse.statusCode message:message];
            }
            completion(success, statusError);
        }
    }];
    [task resume];
}

- (NSMutableURLRequest *)sponsorBlockRequestWithURL:(NSURL *)url method:(NSString *)method timeout:(NSTimeInterval)timeout {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = method;
    request.timeoutInterval = timeout;
    [request setValue:@"BiliBiliMApp/1.0" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"BiliBiliMApp" forHTTPHeaderField:@"Origin"];
    [request setValue:@"BiliBiliMApp" forHTTPHeaderField:@"x-ext-name"];
    [request setValue:@"1.0" forHTTPHeaderField:@"x-ext-version"];
    return request;
}

- (NSURL *)requestURLWithVideoID:(NSString *)videoID cid:(NSInteger)cid categories:(NSArray<NSString *> *)categories {
    NSArray<NSString *> *effectiveCategories = categories.count > 0 ? categories : @[@"sponsor"];
    NSData *categoryData = [NSJSONSerialization dataWithJSONObject:effectiveCategories options:0 error:nil];
    NSString *categoryString = [[NSString alloc] initWithData:categoryData encoding:NSUTF8StringEncoding] ?: @"[\"sponsor\"]";
    
    NSString *baseURLString = [NJSponsorBlockSettings serverBaseURLString];
    NSString *separator = [baseURLString hasSuffix:@"/"] ? @"" : @"/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@api/skipSegments", baseURLString, separator];
    NSURLComponents *components = [NSURLComponents componentsWithString:urlString];
    components.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"videoID" value:videoID],
        [NSURLQueryItem queryItemWithName:@"cid" value:[NSString stringWithFormat:@"%ld", (long)cid]],
        [NSURLQueryItem queryItemWithName:@"categories" value:categoryString],
    ];
    return components.URL;
}

- (NSURL *)viewedSegmentURLWithUUID:(NSString *)uuid {
    NSString *baseURLString = [NJSponsorBlockSettings serverBaseURLString];
    NSString *separator = [baseURLString hasSuffix:@"/"] ? @"" : @"/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@api/viewedVideoSponsorTime", baseURLString, separator];
    NSURLComponents *components = [NSURLComponents componentsWithString:urlString];
    components.queryItems = @[[NSURLQueryItem queryItemWithName:@"UUID" value:uuid]];
    return components.URL;
}

- (NSURL *)voteURLWithUUID:(NSString *)uuid type:(NSInteger)type {
    NSString *baseURLString = [NJSponsorBlockSettings serverBaseURLString];
    NSString *separator = [baseURLString hasSuffix:@"/"] ? @"" : @"/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@api/voteOnSponsorTime", baseURLString, separator];
    NSURLComponents *components = [NSURLComponents componentsWithString:urlString];
    components.queryItems = @[
        [NSURLQueryItem queryItemWithName:@"UUID" value:uuid],
        [NSURLQueryItem queryItemWithName:@"userID" value:[self sponsorBlockUserID]],
        [NSURLQueryItem queryItemWithName:@"type" value:[NSString stringWithFormat:@"%ld", (long)type]],
    ];
    return components.URL;
}

- (NSURL *)submitURL {
    NSString *baseURLString = [NJSponsorBlockSettings serverBaseURLString];
    NSString *separator = [baseURLString hasSuffix:@"/"] ? @"" : @"/";
    NSString *urlString = [NSString stringWithFormat:@"%@%@api/skipSegments", baseURLString, separator];
    return [NSURL URLWithString:urlString];
}

- (NSString *)sponsorBlockUserID {
    NSUserDefaults *defaults = NSUserDefaults.standardUserDefaults;
    NSString *userID = [defaults stringForKey:NJSponsorBlockUserIDKey];
    if (userID.length > 0) {
        return userID;
    }
    userID = NSUUID.UUID.UUIDString;
    [defaults setObject:userID forKey:NJSponsorBlockUserIDKey];
    return userID;
}

- (NSError *)errorWithCode:(NSInteger)code message:(NSString *)message {
    return [NSError errorWithDomain:NJSponsorBlockServiceErrorDomain
                               code:code
                           userInfo:@{NSLocalizedDescriptionKey: message ?: @"SponsorBlock request failed"}];
}

- (BOOL)timeNumbersAreValid:(NSArray<NSNumber *> *)segment {
    for (NSNumber *number in segment) {
        if (![number respondsToSelector:@selector(doubleValue)]) {
            return NO;
        }
        NSTimeInterval time = number.doubleValue;
        if (time < 0 || !isfinite(time)) {
            return NO;
        }
    }
    return YES;
}

@end
