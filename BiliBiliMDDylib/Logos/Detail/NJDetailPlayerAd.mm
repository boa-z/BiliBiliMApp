#line 1 "BiliBiliMDDylib/Logos/Detail/NJDetailPlayerAd.xm"


























































































































#import <UIKit/UIKit.h>
#import "NJCommonDefine.h"
#import "NJSponsorBlockPanelView.h"
#import "NJSponsorBlockManager.h"
#import <objc/runtime.h>


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

__asm__(".linker_option \"-framework\", \"CydiaSubstrate\"");

@class BBPlayerBizGotoStoryWidget; @class BBPlayerUpTagWidget; @class BBPlayerGotoStoryWidget; @class BBPlayerFlexContainerWidget; @class BAPICommunityServiceDmV1Command; @class BBPlayerPortraitScreenBottomWidget; @class BBPlayerOperationTagService; @class BAPIAppPlayeruniteV1PlayViewUniteReply; @class BBPlayerSeekbarContainerView; @class BBPlayerControlContainerWidgetView; @class BAPIAppViewuniteV1ViewReply; @class BAPIAppViewuniteV1ViewProgressReply; @class BAPICommunityServiceDmV1DmViewReply; 


#line 129 "BiliBiliMDDylib/Logos/Detail/NJDetailPlayerAd.xm"
static BBPlayerUpTagWidget* (*_logos_orig$App$BBPlayerUpTagWidget$initWithContext$)(_LOGOS_SELF_TYPE_INIT BBPlayerUpTagWidget*, SEL, id) _LOGOS_RETURN_RETAINED; static BBPlayerUpTagWidget* _logos_method$App$BBPlayerUpTagWidget$initWithContext$(_LOGOS_SELF_TYPE_INIT BBPlayerUpTagWidget*, SEL, id) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints)(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints)(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST, SEL); static BBPlayerBizGotoStoryWidget* (*_logos_orig$App$BBPlayerBizGotoStoryWidget$initWithContext$)(_LOGOS_SELF_TYPE_INIT BBPlayerBizGotoStoryWidget*, SEL, id) _LOGOS_RETURN_RETAINED; static BBPlayerBizGotoStoryWidget* _logos_method$App$BBPlayerBizGotoStoryWidget$initWithContext$(_LOGOS_SELF_TYPE_INIT BBPlayerBizGotoStoryWidget*, SEL, id) _LOGOS_RETURN_RETAINED; static BBPlayerGotoStoryWidget* (*_logos_orig$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$)(_LOGOS_SELF_TYPE_INIT BBPlayerGotoStoryWidget*, SEL, id, id) _LOGOS_RETURN_RETAINED; static BBPlayerGotoStoryWidget* _logos_method$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$(_LOGOS_SELF_TYPE_INIT BBPlayerGotoStoryWidget*, SEL, id, id) _LOGOS_RETURN_RETAINED; static NSArray * (*_logos_orig$App$BBPlayerOperationTagService$tagModels)(_LOGOS_SELF_TYPE_NORMAL BBPlayerOperationTagService* _LOGOS_SELF_CONST, SEL); static NSArray * _logos_method$App$BBPlayerOperationTagService$tagModels(_LOGOS_SELF_TYPE_NORMAL BBPlayerOperationTagService* _LOGOS_SELF_CONST, SEL); static NSSet<NSNumber *> * _logos_method$App$BBPlayerOperationTagService$nj_filterTypes(_LOGOS_SELF_TYPE_NORMAL BBPlayerOperationTagService* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets)(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerFlexContainerWidget$dealloc)(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerFlexContainerWidget$dealloc(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerControlContainerWidgetView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerControlContainerWidgetView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerControlContainerWidgetView$didMoveToWindow)(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerControlContainerWidgetView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$App$BBPlayerSeekbarContainerView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL BBPlayerSeekbarContainerView* _LOGOS_SELF_CONST, SEL); static void _logos_method$App$BBPlayerSeekbarContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL BBPlayerSeekbarContainerView* _LOGOS_SELF_CONST, SEL); static BAPICommunityServiceDmV1DmViewReply* (*_logos_orig$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$)(_LOGOS_SELF_TYPE_INIT BAPICommunityServiceDmV1DmViewReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPICommunityServiceDmV1DmViewReply* _logos_method$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPICommunityServiceDmV1DmViewReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppViewuniteV1ViewReply* (*_logos_orig$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$)(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppViewuniteV1ViewReply* _logos_method$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppPlayeruniteV1PlayViewUniteReply* (*_logos_orig$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$)(_LOGOS_SELF_TYPE_INIT BAPIAppPlayeruniteV1PlayViewUniteReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppPlayeruniteV1PlayViewUniteReply* _logos_method$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppPlayeruniteV1PlayViewUniteReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppViewuniteV1ViewProgressReply* (*_logos_orig$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$)(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewProgressReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; static BAPIAppViewuniteV1ViewProgressReply* _logos_method$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewProgressReply*, SEL, id, id, id *) _LOGOS_RETURN_RETAINED; 

@interface BBPlayerWidget : NSObject

@property (readonly, weak, nonatomic) BBPlayerWidget *superWidget;
@property (readonly, copy, nonatomic) NSArray *subWidgets;

@end

@interface BBPlayerUpTagWidget : NSObject

@end




static BBPlayerUpTagWidget* _logos_method$App$BBPlayerUpTagWidget$initWithContext$(_LOGOS_SELF_TYPE_INIT BBPlayerUpTagWidget* __unused self, SEL __unused _cmd, id context) _LOGOS_RETURN_RETAINED {
    return nil;
}



@interface BBPlayerPortraitScreenBottomWidget : NSObject


- (id)upTagWidget;

- (id)operationTagWidget;

@end




static void _logos_method$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BBPlayerWidget *upTagWidget = [self upTagWidget];
    if (upTagWidget) {
        _logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints(self, _cmd);
    }
}


static void _logos_method$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints(_LOGOS_SELF_TYPE_NORMAL BBPlayerPortraitScreenBottomWidget* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BBPlayerWidget *operationTagWidget = [self operationTagWidget];
    if (operationTagWidget) {
        _logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints(self, _cmd);
    }
}







static BBPlayerBizGotoStoryWidget* _logos_method$App$BBPlayerBizGotoStoryWidget$initWithContext$(_LOGOS_SELF_TYPE_INIT BBPlayerBizGotoStoryWidget* __unused self, SEL __unused _cmd, id context) _LOGOS_RETURN_RETAINED {
    if (NJ_VERTICAL_SCREEN_MODE_VALUE) {
        return _logos_orig$App$BBPlayerBizGotoStoryWidget$initWithContext$(self, _cmd, context);
    }
    return nil;
}






static BBPlayerGotoStoryWidget* _logos_method$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$(_LOGOS_SELF_TYPE_INIT BBPlayerGotoStoryWidget* __unused self, SEL __unused _cmd, id context, id configuration) _LOGOS_RETURN_RETAINED {
    if (NJ_VERTICAL_SCREEN_MODE_VALUE) {
        return _logos_orig$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$(self, _cmd, context, configuration);
    }
    return nil;
}



@interface BBPlayerCoreOperationTagModel : NSObject

@property (nonatomic) unsigned long long type;

@end


@interface BBPlayerOperationTagService : NSObject

@property (retain, nonatomic) NSArray *tagModels;

- (NSSet<NSNumber *> *)nj_filterTypes;

@end



static NSArray * _logos_method$App$BBPlayerOperationTagService$tagModels(_LOGOS_SELF_TYPE_NORMAL BBPlayerOperationTagService* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSArray *origTagModels = _logos_orig$App$BBPlayerOperationTagService$tagModels(self, _cmd);
    NSMutableArray *items = [NSMutableArray array];
    for (BBPlayerCoreOperationTagModel *item in origTagModels) {
        if ([[self nj_filterTypes] containsObject:@(item.type)]) {
            continue;
        }
        [items addObject:item];
    }
    
    [self setValue:items forKeyPath:@"_tagModels"];
    return items;
}


static NSSet<NSNumber *> * _logos_method$App$BBPlayerOperationTagService$nj_filterTypes(_LOGOS_SELF_TYPE_NORMAL BBPlayerOperationTagService* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSSet *filterSet = objc_getAssociatedObject(self, @selector(nj_filterTypes));
    if (!filterSet) {
        NSArray *types = @[
            @(1),      
        ];
        filterSet = [NSSet setWithArray:types];
        objc_setAssociatedObject(self, @selector(nj_filterTypes), filterSet, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return filterSet;
}



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



static void _logos_method$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

    _logos_orig$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets(self, _cmd);
    NJSponsorBlockInstallSeekbarTimelinesFromWidget(self);
}

static void _logos_method$App$BBPlayerFlexContainerWidget$dealloc(_LOGOS_SELF_TYPE_NORMAL BBPlayerFlexContainerWidget* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [NJSponsorBlockPanelView removePanel];
    _logos_orig$App$BBPlayerFlexContainerWidget$dealloc(self, _cmd);
}





static void _logos_method$App$BBPlayerControlContainerWidgetView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$App$BBPlayerControlContainerWidgetView$layoutSubviews(self, _cmd);
    UIView *controlContainer = (UIView *)self;
    NJSponsorBlockInstallDirectTopEntryFromControlContainer(controlContainer);
    NJSponsorBlockScheduleTopEntryInstall(controlContainer);
}

static void _logos_method$App$BBPlayerControlContainerWidgetView$didMoveToWindow(_LOGOS_SELF_TYPE_NORMAL BBPlayerControlContainerWidgetView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$App$BBPlayerControlContainerWidgetView$didMoveToWindow(self, _cmd);
    UIView *controlContainer = (UIView *)self;
    NJSponsorBlockScheduleTopEntryInstall(controlContainer);
}





static void _logos_method$App$BBPlayerSeekbarContainerView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL BBPlayerSeekbarContainerView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$App$BBPlayerSeekbarContainerView$layoutSubviews(self, _cmd);
    [NJSponsorBlockPanelView installNativeTimelineInView:(UIView *)self];
}





@interface BAPICommunityServiceDmV1Command : NSObject


@property (retain, nonatomic) NSMutableArray *commandDmsArray;

@end






@interface BAPICommunityServiceDmV1DmViewReply : NSObject

@property (retain, nonatomic) BAPICommunityServiceDmV1Command *command;

@property (retain, nonatomic) NSMutableArray *activityMetaArray;

@end



static BAPICommunityServiceDmV1DmViewReply* _logos_method$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPICommunityServiceDmV1DmViewReply* __unused self, SEL __unused _cmd, id data, id registry, id * error) _LOGOS_RETURN_RETAINED {
    BAPICommunityServiceDmV1DmViewReply *ret = _logos_orig$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$(self, _cmd, data, registry, error);
    
    [ret.command.commandDmsArray removeAllObjects];
    
    [ret.activityMetaArray removeAllObjects];
    return ret;
}



@interface BAPIAppViewuniteV1ViewReply : NSObject

@end



static BAPIAppViewuniteV1ViewReply* _logos_method$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewReply* __unused self, SEL __unused _cmd, id data, id registry, id * error) _LOGOS_RETURN_RETAINED {
    id ret = _logos_orig$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$(self, _cmd, data, registry, error);
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppViewuniteV1ViewReply"];
    return ret;
}



@interface BAPIAppPlayeruniteV1PlayViewUniteReply : NSObject

@end



static BAPIAppPlayeruniteV1PlayViewUniteReply* _logos_method$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppPlayeruniteV1PlayViewUniteReply* __unused self, SEL __unused _cmd, id data, id registry, id * error) _LOGOS_RETURN_RETAINED {
    id ret = _logos_orig$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$(self, _cmd, data, registry, error);
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppPlayeruniteV1PlayViewUniteReply"];
    return ret;
}



@interface BAPIAppViewuniteV1DmResource : NSObject

@property (retain, nonatomic) NSMutableArray *commandDmsArray;

@property (retain, nonatomic) NSMutableArray *cardsArray;

@end

@interface BAPIAppViewuniteV1ViewProgressReply : NSObject

@property (retain, nonatomic) BAPIAppViewuniteV1DmResource *dm;

@end



static BAPIAppViewuniteV1ViewProgressReply* _logos_method$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$(_LOGOS_SELF_TYPE_INIT BAPIAppViewuniteV1ViewProgressReply* __unused self, SEL __unused _cmd, id data, id registry, id * error) _LOGOS_RETURN_RETAINED {
    BAPIAppViewuniteV1ViewProgressReply *ret = _logos_orig$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$(self, _cmd, data, registry, error);
    [[NJSponsorBlockManager sharedInstance] inspectModelObject:ret source:@"BAPIAppViewuniteV1ViewProgressReply"];
    
    [ret.dm.cardsArray removeAllObjects];
    return ret;
}


 


static __attribute__((constructor)) void _logosLocalCtor_2d4f10e8(int __unused argc, char __unused **argv, char __unused **envp) {
    if (NJ_MASTER_SWITCH_VALUE) {
        {Class _logos_class$App$BBPlayerUpTagWidget = objc_getClass("BBPlayerUpTagWidget"); { MSHookMessageEx(_logos_class$App$BBPlayerUpTagWidget, @selector(initWithContext:), (IMP)&_logos_method$App$BBPlayerUpTagWidget$initWithContext$, (IMP*)&_logos_orig$App$BBPlayerUpTagWidget$initWithContext$);}Class _logos_class$App$BBPlayerPortraitScreenBottomWidget = objc_getClass("BBPlayerPortraitScreenBottomWidget"); { MSHookMessageEx(_logos_class$App$BBPlayerPortraitScreenBottomWidget, @selector(setupFirstControlConstraints), (IMP)&_logos_method$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints, (IMP*)&_logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupFirstControlConstraints);}{ MSHookMessageEx(_logos_class$App$BBPlayerPortraitScreenBottomWidget, @selector(setupSecondControlConstraints), (IMP)&_logos_method$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints, (IMP*)&_logos_orig$App$BBPlayerPortraitScreenBottomWidget$setupSecondControlConstraints);}Class _logos_class$App$BBPlayerBizGotoStoryWidget = objc_getClass("BBPlayerBizGotoStoryWidget"); { MSHookMessageEx(_logos_class$App$BBPlayerBizGotoStoryWidget, @selector(initWithContext:), (IMP)&_logos_method$App$BBPlayerBizGotoStoryWidget$initWithContext$, (IMP*)&_logos_orig$App$BBPlayerBizGotoStoryWidget$initWithContext$);}Class _logos_class$App$BBPlayerGotoStoryWidget = objc_getClass("BBPlayerGotoStoryWidget"); { MSHookMessageEx(_logos_class$App$BBPlayerGotoStoryWidget, @selector(initWithContext:flexConfiguration:), (IMP)&_logos_method$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$, (IMP*)&_logos_orig$App$BBPlayerGotoStoryWidget$initWithContext$flexConfiguration$);}Class _logos_class$App$BBPlayerOperationTagService = objc_getClass("BBPlayerOperationTagService"); { MSHookMessageEx(_logos_class$App$BBPlayerOperationTagService, @selector(tagModels), (IMP)&_logos_method$App$BBPlayerOperationTagService$tagModels, (IMP*)&_logos_orig$App$BBPlayerOperationTagService$tagModels);}{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(NSSet<NSNumber *> *), strlen(@encode(NSSet<NSNumber *> *))); i += strlen(@encode(NSSet<NSNumber *> *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$App$BBPlayerOperationTagService, @selector(nj_filterTypes), (IMP)&_logos_method$App$BBPlayerOperationTagService$nj_filterTypes, _typeEncoding); }Class _logos_class$App$BBPlayerFlexContainerWidget = objc_getClass("BBPlayerFlexContainerWidget"); { MSHookMessageEx(_logos_class$App$BBPlayerFlexContainerWidget, @selector(didLayoutSubWidgets), (IMP)&_logos_method$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets, (IMP*)&_logos_orig$App$BBPlayerFlexContainerWidget$didLayoutSubWidgets);}{ MSHookMessageEx(_logos_class$App$BBPlayerFlexContainerWidget, sel_registerName("dealloc"), (IMP)&_logos_method$App$BBPlayerFlexContainerWidget$dealloc, (IMP*)&_logos_orig$App$BBPlayerFlexContainerWidget$dealloc);}Class _logos_class$App$BBPlayerControlContainerWidgetView = objc_getClass("BBPlayerControlContainerWidgetView"); { MSHookMessageEx(_logos_class$App$BBPlayerControlContainerWidgetView, @selector(layoutSubviews), (IMP)&_logos_method$App$BBPlayerControlContainerWidgetView$layoutSubviews, (IMP*)&_logos_orig$App$BBPlayerControlContainerWidgetView$layoutSubviews);}{ MSHookMessageEx(_logos_class$App$BBPlayerControlContainerWidgetView, @selector(didMoveToWindow), (IMP)&_logos_method$App$BBPlayerControlContainerWidgetView$didMoveToWindow, (IMP*)&_logos_orig$App$BBPlayerControlContainerWidgetView$didMoveToWindow);}Class _logos_class$App$BBPlayerSeekbarContainerView = objc_getClass("BBPlayerSeekbarContainerView"); { MSHookMessageEx(_logos_class$App$BBPlayerSeekbarContainerView, @selector(layoutSubviews), (IMP)&_logos_method$App$BBPlayerSeekbarContainerView$layoutSubviews, (IMP*)&_logos_orig$App$BBPlayerSeekbarContainerView$layoutSubviews);}Class _logos_class$App$BAPICommunityServiceDmV1DmViewReply = objc_getClass("BAPICommunityServiceDmV1DmViewReply"); { MSHookMessageEx(_logos_class$App$BAPICommunityServiceDmV1DmViewReply, @selector(initWithData:extensionRegistry:error:), (IMP)&_logos_method$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$, (IMP*)&_logos_orig$App$BAPICommunityServiceDmV1DmViewReply$initWithData$extensionRegistry$error$);}Class _logos_class$App$BAPIAppViewuniteV1ViewReply = objc_getClass("BAPIAppViewuniteV1ViewReply"); { MSHookMessageEx(_logos_class$App$BAPIAppViewuniteV1ViewReply, @selector(initWithData:extensionRegistry:error:), (IMP)&_logos_method$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$, (IMP*)&_logos_orig$App$BAPIAppViewuniteV1ViewReply$initWithData$extensionRegistry$error$);}Class _logos_class$App$BAPIAppPlayeruniteV1PlayViewUniteReply = objc_getClass("BAPIAppPlayeruniteV1PlayViewUniteReply"); { MSHookMessageEx(_logos_class$App$BAPIAppPlayeruniteV1PlayViewUniteReply, @selector(initWithData:extensionRegistry:error:), (IMP)&_logos_method$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$, (IMP*)&_logos_orig$App$BAPIAppPlayeruniteV1PlayViewUniteReply$initWithData$extensionRegistry$error$);}Class _logos_class$App$BAPIAppViewuniteV1ViewProgressReply = objc_getClass("BAPIAppViewuniteV1ViewProgressReply"); { MSHookMessageEx(_logos_class$App$BAPIAppViewuniteV1ViewProgressReply, @selector(initWithData:extensionRegistry:error:), (IMP)&_logos_method$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$, (IMP*)&_logos_orig$App$BAPIAppViewuniteV1ViewProgressReply$initWithData$extensionRegistry$error$);}}
    }
}
