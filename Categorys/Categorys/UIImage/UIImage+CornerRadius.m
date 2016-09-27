//
//  UIImage+CornerRadius.m
//  Test
//
//  Created by tongxuan on 16/9/27.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

- (UIImage *)imageWithCornerRadius:(float)cornerRadius {
    return [self imageWithCornerRadius:cornerRadius inRect:CGRectMake(0, 0, self.size.width, self.size.height)];
}

- (UIImage *)imageWithCornerRadius:(float)cornerRadius inRect:(CGRect)rect {
    UIImage * img = nil;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currnetContext, [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath);
    CGContextClip(currnetContext);
    [self drawInRect:rect];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (!img) {
        img = self;
    }
    
    return img;
}

@end
