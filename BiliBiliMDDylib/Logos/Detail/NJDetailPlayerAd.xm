//
//  NJDetailPlayerAd.xm
//  BiliBiliTweak
//
//  Created by touchWorld on 2025/9/10.
//

// 详情页播放器广告

/*
 BBPlayerWidget // 所有组件都继承BBPlayerWidget
    BBPlayerWidget *superWidget;    // 父组件
    NSArray *subWidgets;            // 子组件
    - (void)willLayoutSubWidgets;   // 即将布局子组件
    - (void)didLayoutSubWidgets;    // 已经布局子组件
 
 
 BBPlayerContext    // 上下文
    BBPlayerControlWidgetService *controlWidgetService; // 控制组建服务
        Class rootWidgetClass; // 根组件类型：BBPlayerControlContainerRootWidget
   
 */

/*
 **************** 半屏-横屏视频 ****************
 
 BBPlayerControlContainerRootWidget //  控制根组件
    BBPlayerWidget *_leftBarWidget;    // 左边条组件：BBPlayerFullScreenLeftWidget
    BBPlayerBeyondBoundsWidget *_btmBarWidget;  // 底部条组件
    - (void)_setupSubWidgets;  // 设置子组件
 
 
 BBPlayerBeyondBoundsWidget // 底部条组件
    NSArray *subWidgets;    // 拥有的子组件
        BBPlayerHalfScreenBottomWidget // 半屏底部组件
 
 **************** 半屏底部组件 ****************
 
 BBPlayerHalfScreenBottomWidget // 半屏底部组件
    BBPlayerFlexContainerWidget *_leftControlWidget;    // 左边控制组件
        NSArray *subWidgets // 拥有的子组件
            BBPlayerPlayAndPauseWidget      // 播放和暂停
            BBPlayerSeekbarWidgetV2         // 时间滑动条
            BBPlayerTimeHintLabelWidget     // 时间提示标签
    BBPlayerFlexContainerWidget *_rightControlWidget;   // 右边控制组件
        NSArray *subWidgets // 拥有的子组件
            BBPlayerSwitchScreenWidget      //  全屏按钮
            BBPlayerBizGotoStoryWidget      //  横屏视频的竖屏全屏按钮
            BBPlayerGotoStoryWidget         //  横屏视频的竖屏全屏按钮(8.76.0)
 
 BBPlayerOperationTagWidget
    NSArray *_tagModels;
        BBPlayerCoreOperationTagModel
 
 BBPlayerCoreOperationTagModel
    @property (nonatomic) unsigned long long type;
        type:1      // UP主都在用的宝藏功能
        type:7      // 使用的BGM
 
 **************** 半屏底部组件 ****************
 
 */
/*
 **************** 全屏-横屏视频 ****************
 
 BBPlayerControlContainerRootWidget //  控制根组件
    BBPlayerWidget *_leftBarWidget;    // 左边条组件：BBPlayerFullScreenLeftWidget
    BBPlayerBeyondBoundsWidget *_btmBarWidget;  // 底部条组件
    - (void)_setupSubWidgets;  // 设置子组件
 
 **************** 全屏左边组件 ****************
 
 BBPlayerFullScreenLeftWidget   // 全屏左边组件（横屏）
    BBPlayerFlexContainerWidget *_topControlWidget  // 头部控制组件
        NSArray *subWidgets // 拥有的子组件
            BBPlayerOnlineCounterWidget     // 在线人数
            BBPlayerUpTagWidget             // up主头像
            BBPlayerOperationTagWidget      // 运营标签
 
    BBPlayerFlexContainerWidget *_bottomControlWidget;  // 底部控制组件
        NSArray *subWidgets // 拥有的子组件
            BBPlayerTimeWidget  // 时间组件, 00:00/37:30
 
 **************** 全屏左边组 ****************
 
 **************** 全屏底部组件 ****************
 
 BBPlayerBeyondBoundsWidget // 底部条组件
    NSArray *subWidgets;    // 拥有的子组件
        // 头部
        BBPlayerSeekbarWidgetV2 // 滑动条组件
        // 左边
        BBPlayerPlayAndPauseWidget              // 播放和暂停按钮组件
        BBPlayerFullScreenNextEpisodeWidget     // 全屏下一集组件
        BBPlayerDanmakuSwitchWidget             // 弹幕开关组件
        BBPlayerDanmakuSettingEntranceWidget    // 弹幕设置入口组件
        BBPlayerDanmakuEntranceWidget           // 发送弹幕组件
        // 右边
        BBPlayerVideoQualityWidget                      // 视频质量组件
        BBPlayerLossLessBtnWidget                       // 无损按钮组件
        BBPlayerDolbyBtnWidget                          // 杜比按钮组件
        BBPlayerPlaybackRateWidget                      // 播放速度组件
        BBPlayerFullScreenEpisodeBtnWidget              // 全屏剧集按钮组件
        BBPlayerCaptionWidget                           // 字幕组件
        BBPlayerAIAudioBtnWidget                        // 人工智能音频按钮组件
        BBPlayerInteractiveStoryListEntranceWidget      // 互动故事列表入口组件
 
 **************** 全屏底部组件 ****************
 */
/*
 **************** 半屏-竖屏视频 ****************
 
 */
/*
 **************** 全屏-竖屏视频 ****************
 
 */

/*
 当前播放速度可以从 BBPlayerObject => BBPlayerContext => BBPlayerPlayback => playbackRate
 */

#import <UIKit/UIKit.h>
#import "NJCommonDefine.h"
#import "NJSponsorBlockPanelView.h"
#import "NJSponsorBlockManager.h"
#import <objc/runtime.h>

%group App

@interface BBPlayerWidget : NSObject

@property (readonly, weak, nonatomic) BBPlayerWidget *superWidget;
@property (readonly, copy, nonatomic) NSArray *subWidgets;

@end

@interface BBPlayerUpTagWidget : NSObject

@end

// 全屏播放时的up主头像（经常误触点了关注😮‍💨）
%hook BBPlayerUpTagWidget

- (id)initWithContext:(id)context {
    return nil;
}

%end

@interface BBPlayerPortraitScreenBottomWidget : NSObject

// 全屏播放时的up主头像
- (id)upTagWidget;
// UP主都在用的宝藏功能
- (id)operationTagWidget;

@end

%hook BBPlayerPortraitScreenBottomWidget

// 处理_upTagWidget为nil时的奔溃问题；_secondControlWidget包含_upTagWidget。
- (void)setupFirstControlConstraints {
    BBPlayerWidget *upTagWidget = [self upTagWidget];
    if (upTagWidget) {
        %orig;
    }
}

// 处理_operationTagWidget为nil时的奔溃问题；_firstControlWidget包含_operationTagWidget。
- (void)setupSecondControlConstraints {
    BBPlayerWidget *operationTagWidget = [self operationTagWidget];
    if (operationTagWidget) {
        %orig;
    }
}


%end

// 横屏视频的竖屏全屏按钮
%hook BBPlayerBizGotoStoryWidget

- (id)initWithContext:(id)context {
    if (NJ_VERTICAL_SCREEN_MODE_VALUE) {
        return %orig;
    }
    return nil;
}

%end

// 横屏视频的竖屏全屏按钮(8.76.0)
%hook BBPlayerGotoStoryWidget

- (id)initWithContext:(id)context flexConfiguration:(id)configuration {
    if (NJ_VERTICAL_SCREEN_MODE_VALUE) {
        return %orig;
    }
    return nil;
}

%end

@interface BBPlayerCoreOperationTagModel : NSObject

@property (nonatomic) unsigned long long type;

@end


@interface BBPlayerOperationTagService : NSObject

@property (retain, nonatomic) NSArray *tagModels;
// 过滤类型
- (NSSet<NSNumber *> *)nj_filterTypes;

@end

%hook BBPlayerOperationTagService

- (NSArray *)tagModels {
    NSArray *origTagModels = %orig;
    NSMutableArray *items = [NSMutableArray array];
    for (BBPlayerCoreOperationTagModel *item in origTagModels) {
        if ([[self nj_filterTypes] containsObject:@(item.type)]) {
            continue;
        }
        [items addObject:item];
    }
    // 保存过滤后的数据
    [self setValue:items forKeyPath:@"_tagModels"];
    return items;
}

%new
- (NSSet<NSNumber *> *)nj_filterTypes {
    NSSet *filterSet = objc_getAssociatedObject(self, @selector(nj_filterTypes));
    if (!filterSet) {
        NSArray *types = @[
            @(1),      // UP主都在用的宝藏功能
        ];
        filterSet = [NSSet setWithArray:types];
        objc_setAssociatedObject(self, @selector(nj_filterTypes), filterSet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return filterSet;
}

%end

@interface BBPlayerFlexContainerWidget : BBPlayerWidget

@end

@interface BBPlayerControlContainerWidgetView : UIView
@end

@interface BBPlayerSeekbarContainerView : UIView
@end

static BOOL NJSponsorBlockViewIsVisible(UIView *view) {
    return view && !view.hidden && view.alpha > 0.01 && !CGRectIsEmpty(view.bounds);
}

static UIView *NJSponsorBlockRootViewFromControlContainerStrict(UIView *controlContainer) {
    if (!controlContainer) {
        return nil;
    }

    @try {
        id rootView = [controlContainer valueForKey:@"_rootView"];
        if ([rootView isKindOfClass:UIView.class] &&
            ![rootView isKindOfClass:UIWindow.class] &&
            NJSponsorBlockViewIsVisible((UIView *)rootView)) {
            return (UIView *)rootView;
        }
    } @catch (NSException *exception) {
        NSLog(@"[NJSponsorBlock] failed to get _rootView from %@ exception=%@", controlContainer, exception);
    }

    return nil;
}

static NSInteger NJSponsorBlockDirectVisibleControlCount(UIView *view) {
    NSInteger count = 0;
    for (UIView *subview in view.subviews) {
        if (!NJSponsorBlockViewIsVisible(subview)) {
            continue;
        }
        if ([subview isKindOfClass:UIControl.class]) {
            count++;
        }
    }
    return count;
}

static BOOL NJSponsorBlockShouldLogTopEntryContainer(UIView *container) {
    static NSHashTable<UIView *> *loggedContainers = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loggedContainers = [NSHashTable weakObjectsHashTable];
    });
    
    @synchronized (loggedContainers) {
        if ([loggedContainers containsObject:container]) {
            return NO;
        }
        [loggedContainers addObject:container];
        return YES;
    }
}

static UIView *NJSponsorBlockFindTopRightButtonContainerRecursively(UIView *rootView, UIView *coordinateView, NSInteger depth) {
    if (!NJSponsorBlockViewIsVisible(rootView) || !coordinateView || depth > 8) {
        return nil;
    }

    CGRect frame = [rootView convertRect:rootView.bounds toView:coordinateView];
    CGFloat rootWidth = CGRectGetWidth(coordinateView.bounds);
    CGFloat width = CGRectGetWidth(frame);
    CGFloat height = CGRectGetHeight(frame);

    NSInteger directControlCount = NJSponsorBlockDirectVisibleControlCount(rootView);

    BOOL looksLikeButtonContainer =
        directControlCount >= 2 &&
        width >= 80.0 &&
        width <= 320.0 &&
        height >= 32.0 &&
        height <= 64.0 &&
        CGRectGetMinY(frame) <= 88.0 &&
        CGRectGetMidX(frame) >= rootWidth * 0.45;

    if (looksLikeButtonContainer) {
        if (NJSponsorBlockShouldLogTopEntryContainer(rootView)) {
            NSLog(@"[NJSponsorBlock] recursive button container found %@ frame=%@ controls=%ld subviews=%@",
                  rootView,
                  NSStringFromCGRect(frame),
                  (long)directControlCount,
                  rootView.subviews);
        }
        return rootView;
    }

    for (UIView *subview in rootView.subviews) {
        if (!NJSponsorBlockViewIsVisible(subview)) {
            continue;
        }

        UIView *found = NJSponsorBlockFindTopRightButtonContainerRecursively(subview, coordinateView, depth + 1);
        if (found) {
            return found;
        }
    }

    return nil;
}

static UIView *NJSponsorBlockFindDirectTopRightButtonContainer(UIView *controlContainer) {
    if (!NJSponsorBlockViewIsVisible(controlContainer)) {
        return nil;
    }

    UIView *rootView = NJSponsorBlockRootViewFromControlContainerStrict(controlContainer);

    /*
     如果 KVC 拿到的是错误 root，或者拿不到，就从 controlContainer 自己开始找。
     这一步很重要，因为日志显示 _rootView 可能会拿到 BBVDDetailVC.view 或 BiliWindow。
     */
    if (!NJSponsorBlockViewIsVisible(rootView) ||
        [rootView isKindOfClass:UIWindow.class] ||
        CGRectGetWidth(rootView.bounds) > CGRectGetWidth(controlContainer.bounds) * 1.5 ||
        CGRectGetHeight(rootView.bounds) > CGRectGetHeight(controlContainer.bounds) * 2.0) {
        rootView = controlContainer;
    }

    UIView *found = NJSponsorBlockFindTopRightButtonContainerRecursively(rootView, rootView, 0);
    if (found) {
        return found;
    }

    /*
     如果 controlContainer 这棵树里找不到，再尝试从 window 中找靠近播放器区域的按钮容器。
     */
    UIWindow *window = controlContainer.window;
    if (window) {
        CGRect playerFrame = [controlContainer convertRect:controlContainer.bounds toView:window];

        UIView *best = nil;
        CGFloat bestScore = CGFLOAT_MAX;

        NSMutableArray<UIView *> *stack = [NSMutableArray arrayWithObject:window];
        while (stack.count > 0) {
            UIView *view = stack.lastObject;
            [stack removeLastObject];

            if (!NJSponsorBlockViewIsVisible(view)) {
                continue;
            }

            CGRect frame = [view convertRect:view.bounds toView:window];
            NSInteger count = NJSponsorBlockDirectVisibleControlCount(view);

            BOOL candidate =
                count >= 2 &&
                CGRectGetWidth(frame) >= 80.0 &&
                CGRectGetWidth(frame) <= 320.0 &&
                CGRectGetHeight(frame) >= 32.0 &&
                CGRectGetHeight(frame) <= 64.0 &&
                CGRectGetMinY(frame) >= CGRectGetMinY(playerFrame) - 8.0 &&
                CGRectGetMaxY(frame) <= CGRectGetMinY(playerFrame) + 96.0 &&
                CGRectGetMidX(frame) >= CGRectGetMidX(playerFrame);

            if (candidate) {
                CGFloat score = fabs(CGRectGetMinY(frame) - CGRectGetMinY(playerFrame)) +
                                fabs(CGRectGetMaxX(frame) - CGRectGetMaxX(playerFrame));
                if (score < bestScore) {
                    best = view;
                    bestScore = score;
                }
            }

            for (UIView *subview in view.subviews) {
                [stack addObject:subview];
            }
        }

        if (best) {
            if (NJSponsorBlockShouldLogTopEntryContainer(best)) {
                NSLog(@"[NJSponsorBlock] window recursive button container found %@ frame=%@ subviews=%@",
                      best,
                      NSStringFromCGRect([best convertRect:best.bounds toView:window]),
                      best.subviews);
            }
            return best;
        }
    }

    return nil;
}

static BOOL NJSponsorBlockInstallDirectTopEntryFromControlContainer(UIView *controlContainer) {
    if (!controlContainer || !NJ_MASTER_SWITCH_VALUE) {
        return NO;
    }
    
    UIView *targetContainer = NJSponsorBlockFindDirectTopRightButtonContainer(controlContainer);
    if (!targetContainer) {
        return NO;
    }
    
    [NJSponsorBlockPanelView installEntryDirectlyInContainer:targetContainer];
    return YES;
}

static void NJSponsorBlockScheduleTopEntryInstall(UIView *controlContainer) {
    static char NJSponsorBlockTopEntryRetryScheduledKey;
    if (!controlContainer || objc_getAssociatedObject(controlContainer, &NJSponsorBlockTopEntryRetryScheduledKey)) {
        return;
    }
    objc_setAssociatedObject(controlContainer, &NJSponsorBlockTopEntryRetryScheduledKey, @YES, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSArray<NSNumber *> *delays = @[@0.05, @0.20, @0.50, @1.00, @1.50];
    for (NSNumber *delay in delays) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay.doubleValue * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            BOOL isFinalAttempt = delay == delays.lastObject;
            BOOL installed = NJSponsorBlockInstallDirectTopEntryFromControlContainer(controlContainer);
            if (!installed && isFinalAttempt) {
                NSLog(@"[NJSponsorBlock] direct top entry container not found for %@", controlContainer);
            }
            if (isFinalAttempt) {
                objc_setAssociatedObject(controlContainer, &NJSponsorBlockTopEntryRetryScheduledKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            }
        });
    }
}

static BOOL NJSponsorBlockWidgetLooksLikeSeekbar(id widget) {
    NSString *className = NSStringFromClass([widget class]);
    return [className rangeOfString:@"Seekbar" options:NSCaseInsensitiveSearch].location != NSNotFound
        || [className rangeOfString:@"Slider" options:NSCaseInsensitiveSearch].location != NSNotFound
        || [className rangeOfString:@"Progress" options:NSCaseInsensitiveSearch].location != NSNotFound;
}

static BOOL NJSponsorBlockViewLooksLikeSeekbarHost(UIView *view) {
    if (!view || view.hidden || view.alpha <= 0.01) {
        return NO;
    }
    CGRect bounds = view.bounds;
    CGFloat width = CGRectGetWidth(bounds);
    CGFloat height = CGRectGetHeight(bounds);
    if (width < 80.0 || height <= 0.0 || height > 64.0) {
        return NO;
    }
    return YES;
}

static UIView *NJSponsorBlockSeekbarHostFromSelector(id widget, SEL selector) {
    if (![widget respondsToSelector:selector]) {
        return nil;
    }
    id value = nil;
    @try {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        value = [widget performSelector:selector];
#pragma clang diagnostic pop
    } @catch (__unused NSException *exception) {
        return nil;
    }
    if ([value isKindOfClass:UIView.class] && NJSponsorBlockViewLooksLikeSeekbarHost(value)) {
        return value;
    }
    return nil;
}

static UIView *NJSponsorBlockFindSeekbarHostView(id widget, NSInteger depth) {
    if (!widget || depth > 1) {
        return nil;
    }
    if ([widget isKindOfClass:UIView.class] && NJSponsorBlockViewLooksLikeSeekbarHost((UIView *)widget)) {
        return (UIView *)widget;
    }
    
    SEL selectors[] = {
        sel_registerName("view"),
        sel_registerName("contentView"),
        sel_registerName("containerView"),
        sel_registerName("progressView"),
        sel_registerName("slider"),
        sel_registerName("seekbarView"),
    };
    for (NSUInteger i = 0; i < sizeof(selectors) / sizeof(SEL); i++) {
        UIView *view = NJSponsorBlockSeekbarHostFromSelector(widget, selectors[i]);
        if (view) {
            return view;
        }
    }
    return nil;
}

static void NJSponsorBlockInstallSeekbarTimelinesFromWidget(BBPlayerWidget *widget) {
    static NSMutableSet<NSString *> *loggedMissingHostClasses = nil;
    if (!loggedMissingHostClasses) {
        loggedMissingHostClasses = [NSMutableSet set];
    }
    
    NSArray *subWidgets = [widget subWidgets];
    for (id subWidget in subWidgets) {
        if (NJSponsorBlockWidgetLooksLikeSeekbar(subWidget)) {
            UIView *hostView = NJSponsorBlockFindSeekbarHostView(subWidget, 0);
            if (hostView) {
                [NJSponsorBlockPanelView installNativeTimelineInView:hostView];
            } else {
                NSString *className = NSStringFromClass([subWidget class]);
                if (![loggedMissingHostClasses containsObject:className]) {
                    [loggedMissingHostClasses addObject:className];
                    NSLog(@"[NJSponsorBlock] seekbar host not found for %@", className);
                }
            }
        }
        if ([subWidget respondsToSelector:@selector(subWidgets)]) {
            NJSponsorBlockInstallSeekbarTimelinesFromWidget(subWidget);
        }
    }
}

%hook BBPlayerFlexContainerWidget

- (void)didLayoutSubWidgets {
//    NSLog(@"%@:%@-%p-%s-subWidgets:%@", nj_logPrefix, NSStringFromClass([(id)self class]), self, __FUNCTION__, [self subWidgets]);
    %orig;
    NJSponsorBlockInstallSeekbarTimelinesFromWidget(self);
}

- (void)dealloc {
    [NJSponsorBlockPanelView removePanel];
    %orig;
}

%end

%hook BBPlayerControlContainerWidgetView

- (void)layoutSubviews {
    %orig;
    UIView *controlContainer = (UIView *)self;
    NJSponsorBlockInstallDirectTopEntryFromControlContainer(controlContainer);
    NJSponsorBlockScheduleTopEntryInstall(controlContainer);
}

- (void)didMoveToWindow {
    %orig;
    UIView *controlContainer = (UIView *)self;
    NJSponsorBlockScheduleTopEntryInstall(controlContainer);
}

%end

%hook BBPlayerSeekbarContainerView

- (void)layoutSubviews {
    %orig;
    [NJSponsorBlockPanelView installNativeTimelineInView:(UIView *)self];
}

%end


// 移除投票/点赞+投币+收藏+关注/推荐视频/评分
@interface BAPICommunityServiceDmV1Command : NSObject

/// 弹幕命令，比如投票弹幕、关注弹幕
@property (retain, nonatomic) NSMutableArray *commandDmsArray;

@end

%hook BAPICommunityServiceDmV1Command

%end

/// 请求弹幕数据
@interface BAPICommunityServiceDmV1DmViewReply : NSObject

@property (retain, nonatomic) BAPICommunityServiceDmV1Command *command;
/// 活动，比如云视听小电视
@property (retain, nonatomic) NSMutableArray *activityMetaArray;

@end

%hook BAPICommunityServiceDmV1DmViewReply

- (id)initWithData:(id)data extensionRegistry:(id)registry error:(id *)error {
    BAPICommunityServiceDmV1DmViewReply *ret = %orig;
    // 移除所有弹幕命令，比如投票弹幕、关注弹幕
    [ret.command.commandDmsArray removeAllObjects];
    // 移除所有活动，比如云视听小电视
    [ret.activityMetaArray removeAllObjects];
    return ret;
}

%end

@interface BAPIAppViewuniteV1ViewReply : NSObject

@end

%hook BAPIAppViewuniteV1ViewReply

- (id)initWithData:(id)data extensionRegistry:(id)registry error:(id *)error {
    id ret = %orig;
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppViewuniteV1ViewReply"];
    return ret;
}

%end

@interface BAPIAppPlayeruniteV1PlayViewUniteReply : NSObject

@end

%hook BAPIAppPlayeruniteV1PlayViewUniteReply

- (id)initWithData:(id)data extensionRegistry:(id)registry error:(id *)error {
    id ret = %orig;
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppPlayeruniteV1PlayViewUniteReply"];
    return ret;
}

%end

@interface BAPIAppViewuniteV1DmResource : NSObject

@property (retain, nonatomic) NSMutableArray *commandDmsArray;
/// 卡片，比如一键追番
@property (retain, nonatomic) NSMutableArray *cardsArray;

@end

@interface BAPIAppViewuniteV1ViewProgressReply : NSObject

@property (retain, nonatomic) BAPIAppViewuniteV1DmResource *dm;

@end

%hook BAPIAppViewuniteV1ViewProgressReply

- (id)initWithData:(id)data extensionRegistry:(id)registry error:(id *)error {
    BAPIAppViewuniteV1ViewProgressReply *ret = %orig;
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppViewuniteV1ViewProgressReply"];
    // 移除所有卡片，比如一键追番
    [ret.dm.cardsArray removeAllObjects];
    return ret;
}

%end
 
%end

%ctor {
    if (NJ_MASTER_SWITCH_VALUE) {
        %init(App);
    }
}
