//
//  NJSponsorBlockManager.h
//  BiliBiliMDDylib
//

#import <Foundation/Foundation.h>

@class NJSponsorBlockSegment;

NS_ASSUME_NONNULL_BEGIN

@interface NJSponsorBlockManager : NSObject

@property (nonatomic, copy, readonly) NSString *videoID;
@property (nonatomic, assign, readonly) NSInteger cid;

+ (instancetype)sharedInstance;

- (void)updateVideoID:(NSString *)videoID cid:(NSInteger)cid;
- (void)inspectResponseData:(NSData *)data response:(NSURLResponse *)response;
- (nullable NJSponsorBlockSegment *)activeSegmentAtPlaybackTime:(NSTimeInterval)time;
- (void)handlePlaybackTimeForProbe:(NSTimeInterval)time;
- (void)markSegmentSkipped:(NJSponsorBlockSegment *)segment;
- (BOOL)hasSkippedSegment:(NJSponsorBlockSegment *)segment;
- (BOOL)isInCooldown;
- (void)enterCooldown;

@end

NS_ASSUME_NONNULL_END
