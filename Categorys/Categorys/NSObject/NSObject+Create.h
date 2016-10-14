//
//  NSObject+Create.h
//  Test
//
//  Created by tongxuan on 16/10/14.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Create)

+ (instancetype)create:(void(^)(id thisObj))block;

- (instancetype)create:(void(^)(id thisObj))block;


@end
