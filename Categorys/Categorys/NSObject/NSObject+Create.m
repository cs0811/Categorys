//
//  NSObject+Create.m
//  Test
//
//  Created by tongxuan on 16/10/14.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "NSObject+Create.h"

@implementation NSObject (Create)

+ (instancetype)create:(void (^)(id))block {
    id instance = [[self alloc] init];
    block(instance);
    return instance;
}

- (instancetype)create:(void (^)(id))block {
    block(self);
    return self;
}


@end
