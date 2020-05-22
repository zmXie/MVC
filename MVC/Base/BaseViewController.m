//
//  BaseViewController.m
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseModel.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface BaseViewController ()

@property (nonatomic,strong) BaseModel *model;

@end

@implementation BaseViewController

- (void)dealloc
{
    NSLog(@"%@ dealloc",NSStringFromClass(self.class));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self handHUDAndToast];
}

- (void)handHUDAndToast
{
    if (!self.model) return;
    @weakify(self)
    //转菊花
    [RACObserveChanged(self.model, loading) subscribeNext:^(id x) {
        @strongify(self)
        if ([x boolValue]) {
            [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
    //弹toast
    [RACSafeObserve(self.model, toast) subscribeNext:^(id x) {
        @strongify(self)
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.removeFromSuperViewOnHide = YES;
        hud.mode = MBProgressHUDModeText;
        hud.detailsLabel.text = x;
        [hud hideAnimated:YES afterDelay:1];
    }];
}

@end
