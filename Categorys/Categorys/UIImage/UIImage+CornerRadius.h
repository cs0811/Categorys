//
//  UIImage+CornerRadius.h
//  Test
//
//  Created by tongxuan on 16/9/27.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (CornerRadius)

/*
 *  设置圆角    (使用 UIImage 的 size)
 */
- (UIImage *)imageWithCornerRadius:(float)cornerRadius;

/*
 *  设置圆角 
 */
- (UIImage *)imageWithCornerRadius:(float)cornerRadius inRect:(CGRect)rect;

/**
 对IMG做圆角 (在初始的IMG上做自定义算法)
 
 @param image img
 @param cornerRadius 圆角 (相对于 图片本身的大小)
 @return img
 */
+ (UIImage *)dealImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius;

@end
