//
//  BaseModel.h
//  MVC
//
//  Created by xzm on 2020/5/21.
//  Copyright © 2020 SearchBarDemo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseModel : NSObject

@property (nonatomic,strong) NSString *toast;
@property (nonatomic,assign,getter=isLoading) BOOL loading;

@end

NS_ASSUME_NONNULL_END
