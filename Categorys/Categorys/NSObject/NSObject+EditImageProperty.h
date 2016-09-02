//
//  NSObject+EditImageProperty.h
//  HLJTest
//
//  Created by tongxuan on 16/9/2.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (EditImageProperty)

/**
 *  修改图片的 dpi
 */
- (NSData *)editImage:(UIImage *)image toDPI:(float)dpi;

@end
