//
//  UIColor+HexColor.h
//  iWedding
//
//  Created by dev on 16/12/14.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexColor)

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (NSString *)hexStringOfColor:(UIColor *)color;
@end
