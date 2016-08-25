//
//  NSUserDefaults+SaveRead.h
//  iMerchant
//
//  Created by 吴晓辉 on 16/6/17.
//  Copyright © 2016年 suncloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (SaveRead)

+ (id)readForKey:(NSString *)key;

+ (void)saveObject:(id)value forKey:(NSString *)defaultName;

+ (void)removeObjectForKey:(NSString *)defaultName;

@end
