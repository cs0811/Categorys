//
//  UITabBarItem+CustomBadge.m
//  iWedding
//
//  Created by 项元智 on 16/4/7.
//  Copyright © 2016年 suncloud. All rights reserved.
//

#import "UITabBar+CustomBadge.h"
#import <objc/runtime.h>

#define kTabCount 5
#define kBadgetViewTagStart 888

@implementation UITabBar (CustomBadge)

- (void)showBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];

    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = kBadgetViewTagStart + index;
    badgeView.layer.cornerRadius = 4;
    badgeView.backgroundColor = kColorYellow1;
    badgeView.layer.masksToBounds = YES;
    
    CGFloat x = (kScreenWidth/kTabCount) * (index+1) - 20;
    badgeView.frame = CGRectMake(x, 6, 8, 8);
    
    [self addSubview:badgeView];
}

- (void)hideBadgeOnItemIndex:(int)index{
    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(int)index{
    for (UIView *subView in self.subviews) {
        if (subView.tag == kBadgetViewTagStart+index) {
            [subView removeFromSuperview];
        }
    }
}

@end
