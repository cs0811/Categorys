//
//  UIView+PassMsgToSubViews.h
//  Test
//
//  Created by dufei on 16/9/18.
//  Copyright © 2016年 dufei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (PassMsgToSubViews)

/**
 *  传递消息 (父视图到子视图)
 *
 *  @param key
 *  @param info
 *
 */
- (void)passMsgToSubViewsWithKey:(NSString *)key info:(NSDictionary *)info;

@end
