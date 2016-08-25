//
//  UITabBarItem+Additions.h
//  Categorys
//
//  Created by tongxuan on 16/8/25.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarItem (Additions)

+ (UITabBarItem *)itemWithTitle:(NSString *)title imageStr:(NSString *)imgStr selectedImageStr:(NSString *)selectedImgStr;
+ (UITabBarItem *)itemWithTitle:(NSString *)title imageStr:(NSString *)imgStr selectedImageStr:(NSString *)selectedImgStr tag:(NSInteger)tag;

@end
