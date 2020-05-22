//
//  HomeModel.m
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel

- (void)requestAllData
{
    self.loading = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loading = NO;
        BOOL success = arc4random()%2;
        if (success) {
            self.allData = @{@"text":@(arc4random()%100).stringValue};
        } else {
            self.toast = @"网络异常，请稍后再试";
        }
    });
}

@end
