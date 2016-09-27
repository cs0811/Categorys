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

@end
