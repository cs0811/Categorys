//
//  UILabel+CurrentNumberOfLines.h
//  HLJUtils
//
//  Created by tongxuan on 2017/4/11.
//  Copyright © 2017年 xyuanzhi. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 获取当前行数
 */
@interface UILabel (CurrentNumberOfLines)

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth;

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth string:(NSString *)string attributes:(NSDictionary *)attributes;

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth attributedString:(NSAttributedString *)attributedString;

@end
