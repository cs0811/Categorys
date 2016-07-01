//
//  NSObject+SwizzMethod.h
//  Categorys
//
//  Created by tongxuan on 16/7/1.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzMethod)

/**
 *  替换系统方法
 *
 *  @param systemSel 系统方法
 *  @param swizzSel  自定义方法
 */
+ (void)exChanageMethodSystemSel:(SEL)systemSel swizzSel:(SEL)swizzSel;

@end
