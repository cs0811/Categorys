//
//  UITextField+ExtentRange.h
//  iWedding
//
//  Created by 项元智 on 14-9-29.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ExtentRange)

- (NSRange) selectedRange;
- (void) setSelectedRange:(NSRange) range;

@end
