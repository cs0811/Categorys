//
//  UIImageView+LoadImgAfterScrolled.m
//  Categorys
//
//  Created by tongxuan on 16/9/12.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UIImageView+LoadImgAfterScrolled.h"
#import <objc/runtime.h>

@implementation UIImageView (LoadImgAfterScrolled)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setImage:);
        SEL swizzledSelector = @selector(SsetImage:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
    });
}

#pragma mark swizzledSel
- (void)SsetImage:(UIImage *)image {
    
    [self performSelector:@selector(SsetImage:) withObject:image afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
}


@end
