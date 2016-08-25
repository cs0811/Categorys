//
//  NSUserDefaults+SaveRead.m
//  iMerchant
//
//  Created by 吴晓辉 on 16/6/17.
//  Copyright © 2016年 suncloud. All rights reserved.
//

#import "NSUserDefaults+SaveRead.h"

@implementation NSUserDefaults (SaveRead)

+ (id)readForKey:(NSString *)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    id object = [userDefaults objectForKey:key];
    return object;
    
}


+ (void)saveObject:(id)value forKey:(NSString *)defaultName{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setValue:value forKey:defaultName];
    [userDefaults synchronize];

}


+ (void)removeObjectForKey:(NSString *)defaultName{

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:defaultName];
    [[NSUserDefaults standardUserDefaults] synchronize];

    
}

@end
