//
//  UIView+FindFirstResponder.m
//  Categorys
//
//  Created by tongxuan on 16/7/1.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)

- (UIView *)findFirstResponder {
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) {
            return firstResponder;
        }
    }
    return nil;
}

@end
