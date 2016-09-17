//
//  UIView+PassMsgToSubViews.m
//  Test
//
//  Created by dufei on 16/9/18.
//  Copyright © 2016年 dufei. All rights reserved.
//

#import "UIView+PassMsgToSubViews.h"

@implementation UIView (PassMsgToSubViews)

- (void)passMsgToSubViewClass:(Class)className key:(NSString *)key info:(NSDictionary *)info {
    for (UIView * view in self.subviews) {
        if ([view respondsToSelector:@selector(passMsgToSubViewClass:key:info:)]) {
            if (className) {
                if ([view isKindOfClass:className]) {
                    [view passMsgToSubViewClass:className key:key info:info];
                }
            }else {
                [view passMsgToSubViewClass:className key:key info:info];
            }
        }
    }
}

@end
