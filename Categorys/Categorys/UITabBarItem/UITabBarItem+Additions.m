//
//  UITabBarItem+Additions.m
//  Categorys
//
//  Created by tongxuan on 16/8/25.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UITabBarItem+Additions.h"

@implementation UITabBarItem (Additions)

+ (UITabBarItem *)itemWithTitle:(NSString *)title imageStr:(NSString *)imgStr selectedImageStr:(NSString *)selectedImgStr {
    UITabBarItem * item = [UITabBarItem new];
    item.title = title?:@"";
    [item setImage:[[UIImage imageNamed:imgStr?:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[[UIImage imageNamed:selectedImgStr?:imgStr] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return item;
}

+ (UITabBarItem *)itemWithTitle:(NSString *)title imageStr:(NSString *)imgStr selectedImageStr:(NSString *)selectedImgStr tag:(NSInteger)tag {
    UITabBarItem * item = [UITabBarItem itemWithTitle:title imageStr:imgStr selectedImageStr:selectedImgStr];
    item.tag = tag;
    return item;
}

@end
