//
//  BaseViewController.h
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

#define RACSafeObserve(TARGET, KEYPATH) \
({\
[RACObserve(TARGET, KEYPATH)takeUntil:self.rac_willDeallocSignal]; \
})
#define RACObserveChanged(TARGET, KEYPATH) \
({\
[RACSafeObserve(TARGET, KEYPATH) distinctUntilChanged]; \
})

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

@end

NS_ASSUME_NONNULL_END
