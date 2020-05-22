//
//  HomeModel.h
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeModel : BaseModel

@property (nonatomic,strong) NSDictionary *allData;

- (void)requestAllData;

@end

NS_ASSUME_NONNULL_END
