//
//  UIImageView+starRank.h
//  QuicklyShop
//
//  Created by S on 15/8/25.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (starRank)

/**
 左边距 (默认 5)
 */
@property (nonatomic, assign) CGFloat spaceLeft;

/**
 右边距 (默认 5)
 */
@property (nonatomic, assign) CGFloat spaceRight;

/**
 item之间水平间距 (默认 5)
 */
@property (nonatomic, assign) CGFloat spaceH;

/**
 星星等级
 */
@property (nonatomic, assign) CGFloat starRank;

/**
 最多的星星等级
 */
@property (nonatomic, assign) NSInteger maxStarCount;

/**
 灰色星星
 */
@property (nonatomic, copy) NSString * grayStarImg;

/**
 半颗星
 */
@property (nonatomic, copy) NSString * halfStarImg;

/**
 整颗星
 */
@property (nonatomic, copy) NSString * wholeStarImg;

@end
