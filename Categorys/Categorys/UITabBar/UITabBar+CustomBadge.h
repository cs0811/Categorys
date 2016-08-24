//
//  UITabBarItem+CustomBadge.h
//  iWedding
//
//  Created by 项元智 on 16/4/7.
//  Copyright © 2016年 suncloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (CustomBadge)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点
- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
