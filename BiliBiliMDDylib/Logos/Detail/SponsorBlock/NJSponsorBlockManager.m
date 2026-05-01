//
//  NJSponsorBlockManager.m
//  BiliBiliMDDylib
//

#import "NJSponsorBlockManager.h"
#import "NJSponsorBlockSegment.h"
#import "NJSponsorBlockService.h"
#import "NJCommonDefine.h"
#import "NJSettingCache.h"

static NSString * const NJSponsorBlockCachePrefix = @"NJSponsorBlockSegments";
static NSTimeInterval const NJSponsorBlockCacheTTL = 24 * 60 * 60;
static NSTimeInterval const NJSponsorBlockCooldown = 1.0;

@interface NJSponsorBlockCacheItem : NSObject <NSSecureCoding>

@property (nonatomic, copy) NSArray<NJSponsorBlockSegment *> *segments;
@property (nonatomic, strong) NSDate *date;

@end

@implementation NJSponsorBlockCacheItem

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.segments forKey:@"segments"];
    [coder encodeObject:self.date forKey:@"date"];
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        NSSet *classes = [NSSet setWithObjects:[NSArray class], [NJSponsorBlockSegment class], nil];
        self.segments = [coder decodeObjectOfClasses:classes forKey:@"segments"] ?: @[];
        self.date = [coder decodeObjectOfClass:[NSDate class] forKey:@"date"] ?: [NSDate distantPast];
    }
    return self;
}

@end

@interface NJSponsorBlockManager ()

@property (nonatomic, copy) NSString *videoID;
@property (nonatomic, assign) NSInteger cid;
@property (nonatomic, strong) NSArray<NJSponsorBlockSegment *> *segments;
@property (nonatomic, strong) NSMutableSet<NSString *> *skippedUUIDs;
@property (nonatomic, strong) NJSponsorBlockService *service;
@property (nonatomic, strong) NSDate *cooldownUntil;
@property (nonatomic, assign) NSTimeInterval lastProbeLogTime;

@end

@implementation NJSponsorBlockManager

+ (instancetype)sharedInstance {
    static NJSponsorBlockManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[NJSponsorBlockManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.videoID = @"";
        self.segments = @[];
        self.skippedUUIDs = [NSMutableSet set];
        self.service = [[NJSponsorBlockService alloc] init];
        self.cooldownUntil = [NSDate distantPast];
        self.lastProbeLogTime = -100;
    }
    return self;
}

- (void)updateVideoID:(NSString *)videoID cid:(NSInteger)cid {
    if (videoID.length == 0 || cid <= 0) {
        return;
    }
    if ([self.videoID isEqualToString:videoID] && self.cid == cid) {
        return;
    }
    
    self.videoID = videoID;
    self.cid = cid;
    self.segments = @[];
    [self.skippedUUIDs removeAllObjects];
    NSLog(@"[NJSponsorBlock] update video %@:%ld", videoID, (long)cid);
    [self loadSegmentsForCurrentVideoIfNeeded];
}

- (void)inspectResponseData:(NSData *)data response:(NSURLResponse *)response {
    if (!NJ_SPONSOR_BLOCK_VALUE || data.length == 0) {
        return;
    }
    
    if (![self shouldInspectResponse:response data:data]) {
        return;
    }
    
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    if (error || !json) {
        return;
    }
    
    NSDictionary *identity = [self videoIdentityInObject:json];
    NSString *videoID = identity[@"videoID"];
    NSNumber *cid = identity[@"cid"];
    if (videoID.length == 0 || cid.integerValue <= 0) {
        return;
    }
    NSLog(@"[NJSponsorBlock] found video identity %@:%ld from %@", videoID, (long)cid.integerValue, response.URL.absoluteString);
    [self updateVideoID:videoID cid:cid.integerValue];
}

- (BOOL)shouldInspectResponse:(NSURLResponse *)response data:(NSData *)data {
    NSString *url = response.URL.absoluteString.lowercaseString ?: @"";
    NSString *mimeType = response.MIMEType.lowercaseString ?: @"";
    if ([url containsString:@"view"] ||
        [url containsString:@"detail"] ||
        [url containsString:@"player"] ||
        [url containsString:@"playurl"] ||
        [url containsString:@"archive"]) {
        return YES;
    }
    
    if (![mimeType containsString:@"json"] || data.length > 2 * 1024 * 1024) {
        return NO;
    }
    
    NSData *bvidData = [@"bvid" dataUsingEncoding:NSUTF8StringEncoding];
    NSData *cidData = [@"cid" dataUsingEncoding:NSUTF8StringEncoding];
    NSRange range = NSMakeRange(0, data.length);
    return [data rangeOfData:bvidData options:0 range:range].location != NSNotFound &&
           [data rangeOfData:cidData options:0 range:range].location != NSNotFound;
}

- (NJSponsorBlockSegment *)activeSegmentAtPlaybackTime:(NSTimeInterval)time {
    if (!NJ_SPONSOR_BLOCK_VALUE || self.segments.count == 0) {
        return nil;
    }
    
    for (NJSponsorBlockSegment *segment in self.segments) {
        if ([self hasSkippedSegment:segment]) {
            continue;
        }
        if ([segment containsPlaybackTime:time]) {
            return segment;
        }
    }
    return nil;
}

- (void)handlePlaybackTimeForProbe:(NSTimeInterval)time {
    if (!NJ_SPONSOR_BLOCK_VALUE) {
        return;
    }
    
    NJSponsorBlockSegment *segment = [self activeSegmentAtPlaybackTime:time];
    if (segment) {
        NSLog(@"[NJSponsorBlock] active segment %@ %.2f-%.2f current=%.2f", segment.uuid, segment.startTime, segment.endTime, time);
        return;
    }
    
    if (time - self.lastProbeLogTime >= 5.0 || time < self.lastProbeLogTime) {
        self.lastProbeLogTime = time;
        NSLog(@"[NJSponsorBlock] playback time %.2f video=%@ cid=%ld segments=%lu", time, self.videoID, (long)self.cid, (unsigned long)self.segments.count);
    }
}

- (void)markSegmentSkipped:(NJSponsorBlockSegment *)segment {
    if (segment.uuid.length == 0) {
        return;
    }
    [self.skippedUUIDs addObject:segment.uuid];
}

- (BOOL)hasSkippedSegment:(NJSponsorBlockSegment *)segment {
    if (segment.uuid.length == 0) {
        return NO;
    }
    return [self.skippedUUIDs containsObject:segment.uuid];
}

- (BOOL)isInCooldown {
    return [[NSDate date] compare:self.cooldownUntil] == NSOrderedAscending;
}

- (void)enterCooldown {
    self.cooldownUntil = [NSDate dateWithTimeIntervalSinceNow:NJSponsorBlockCooldown];
}

- (void)loadSegmentsForCurrentVideoIfNeeded {
    if (!NJ_SPONSOR_BLOCK_VALUE || self.videoID.length == 0 || self.cid <= 0) {
        return;
    }
    
    NSArray<NJSponsorBlockSegment *> *cachedSegments = [self cachedSegmentsForVideoID:self.videoID cid:self.cid];
    if (cachedSegments) {
        self.segments = cachedSegments;
        return;
    }
    
    NSString *videoID = self.videoID;
    NSInteger cid = self.cid;
    __weak typeof(self) weakSelf = self;
    [self.service fetchSegmentsWithVideoID:videoID cid:cid categories:@[@"sponsor"] completion:^(NSArray<NJSponsorBlockSegment *> *segments, NSError *error) {
        if (error) {
            NSLog(@"[NJSponsorBlock] fetch segments failed: %@", error);
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (!strongSelf || ![strongSelf.videoID isEqualToString:videoID] || strongSelf.cid != cid) {
                return;
            }
            strongSelf.segments = segments;
            [strongSelf saveSegments:segments videoID:videoID cid:cid];
            NSLog(@"[NJSponsorBlock] loaded %lu segments for %@:%ld", (unsigned long)segments.count, videoID, (long)cid);
        });
    }];
}

- (NSArray<NJSponsorBlockSegment *> *)cachedSegmentsForVideoID:(NSString *)videoID cid:(NSInteger)cid {
    NJSponsorBlockCacheItem *item = (NJSponsorBlockCacheItem *)[[NJSettingCache sharedInstance].cache objectForKey:[self cacheKeyWithVideoID:videoID cid:cid]];
    if (![item isKindOfClass:[NJSponsorBlockCacheItem class]]) {
        return nil;
    }
    if (fabs([item.date timeIntervalSinceNow]) > NJSponsorBlockCacheTTL) {
        return nil;
    }
    return item.segments;
}

- (void)saveSegments:(NSArray<NJSponsorBlockSegment *> *)segments videoID:(NSString *)videoID cid:(NSInteger)cid {
    NJSponsorBlockCacheItem *item = [[NJSponsorBlockCacheItem alloc] init];
    item.segments = segments ?: @[];
    item.date = [NSDate date];
    [[NJSettingCache sharedInstance].cache setObject:item forKey:[self cacheKeyWithVideoID:videoID cid:cid] withBlock:nil];
}

- (NSString *)cacheKeyWithVideoID:(NSString *)videoID cid:(NSInteger)cid {
    return [NSString stringWithFormat:@"%@_%@_%ld_sponsor", NJSponsorBlockCachePrefix, videoID, (long)cid];
}

- (NSDictionary *)videoIdentityInObject:(id)object {
    if ([object isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = (NSDictionary *)object;
        NSString *videoID = [self videoIDInDictionary:dictionary];
        NSNumber *cid = [self cidInDictionary:dictionary];
        if (videoID.length > 0 && cid.integerValue > 0) {
            return @{@"videoID": videoID, @"cid": cid};
        }
        
        for (id value in dictionary.allValues) {
            NSDictionary *identity = [self videoIdentityInObject:value];
            if (identity) {
                return identity;
            }
        }
        return nil;
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        for (id value in (NSArray *)object) {
            NSDictionary *identity = [self videoIdentityInObject:value];
            if (identity) {
                return identity;
            }
        }
    }
    return nil;
}

- (NSString *)videoIDInDictionary:(NSDictionary *)dictionary {
    for (NSString *key in dictionary) {
        if (![key isKindOfClass:[NSString class]]) {
            continue;
        }
        NSString *lowerKey = key.lowercaseString;
        if (![lowerKey isEqualToString:@"bvid"] &&
            ![lowerKey isEqualToString:@"bvidstr"] &&
            ![lowerKey isEqualToString:@"bvid_str"] &&
            ![lowerKey isEqualToString:@"bv_id"]) {
            continue;
        }
        id value = dictionary[key];
        if ([value isKindOfClass:[NSString class]] && [value hasPrefix:@"BV"]) {
            return value;
        }
    }
    return nil;
}

- (NSNumber *)cidInDictionary:(NSDictionary *)dictionary {
    for (NSString *key in dictionary) {
        if (![key isKindOfClass:[NSString class]] || ![key.lowercaseString isEqualToString:@"cid"]) {
            continue;
        }
        id value = dictionary[key];
        if ([value respondsToSelector:@selector(integerValue)] && [value integerValue] > 0) {
            return @([value integerValue]);
        }
    }
    return nil;
}

@end
