//
//  ViewController.m
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeModel.h"

@interface HomeViewController ()

@property (nonatomic,strong) HomeModel *model;
@property (weak,  nonatomic) IBOutlet UILabel *label;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self observeModel];
}

- (void)observeModel
{
    @weakify(self)
    //刷新数据
    [RACObserveChanged(self.model, allData) subscribeNext:^(id x) {
        @strongify(self)
        self.label.text = x[@"text"];
    }];
}

#pragma mark - Actions
- (IBAction)refreshAction:(id)sender
{
    [self.model requestAllData];
}

#pragma mark - Lazzy
- (HomeModel *)model
{
    if (!_model) {
        _model = [HomeModel new];
    }
    return _model;
}

@end
