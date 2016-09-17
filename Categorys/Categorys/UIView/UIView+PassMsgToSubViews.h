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
 *  @param className    需要接受信息的类 (为nil时，默认发向所有类)
 *  @param key          key
 *  @param info         info
 *
 */
- (void)passMsgToSubViewClass:(Class)className key:(NSString *)key info:(NSDictionary *)info;

@end
