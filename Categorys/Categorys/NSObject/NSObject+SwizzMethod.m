//
//  NSObject+SwizzMethod.m
//  Categorys
//
//  Created by tongxuan on 16/7/1.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "NSObject+SwizzMethod.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzMethod)

+ (void)exChanageMethodSystemSel:(SEL)systemSel swizzSel:(SEL)swizzSel {

    Method systemMethod = class_getInstanceMethod([self class], systemSel);
    Method swizzMethod = class_getInstanceMethod([self class], swizzSel);

    BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
    if (isAdd) {
        //如果成功，说明类中不存在这个方法的实现
        //将被交换方法的实现替换到这个并不存在的实现
        class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, swizzMethod);
    }
}

@end
