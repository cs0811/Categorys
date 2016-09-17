//
//  UIView+PassMsgToSubViews.m
//  Test
//
//  Created by dufei on 16/9/18.
//  Copyright © 2016年 dufei. All rights reserved.
//

#import "UIView+PassMsgToSubViews.h"

@implementation UIView (PassMsgToSubViews)

- (void)passMsgToSubViewsWithKey:(NSString *)key info:(NSDictionary *)info {
    for (UIView * view in self.subviews) {
        if ([view respondsToSelector:@selector(passMsgToSubViewsWithKey:info:)]) {
            [view passMsgToSubViewsWithKey:key info:info];
        }
    }
}

@end
