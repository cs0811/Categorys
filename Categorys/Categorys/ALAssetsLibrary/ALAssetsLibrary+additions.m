//
//  ALAssetsLibrary+additions.m
//  iWedding
//
//  Created by 项元智 on 15/3/16.
//  Copyright (c) 2015年 suncloud. All rights reserved.
//

#import "ALAssetsLibrary+additions.h"

@implementation ALAssetsLibrary (additions)

-(void)assetForURLEx:(NSURL *)assetURL withSuccessBlock:(void (^)(ALAsset*))successBlock failureBlock:(void (^)(void))failureBlock {
    [self assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        if (asset){
            successBlock(asset);
        }
        else {
            // On iOS 8.1 [library assetForUrl] Photo Streams always returns nil. Try to obtain it in an alternative way
            [self enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
                if(group == nil) {
                    failureBlock();
                    *stop = YES;
                } else {
                    [group enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                        if([result.defaultRepresentation.url isEqual:assetURL]) {
                            successBlock(result);
                            *stop = YES;
                        } else if(result == nil) {
                            failureBlock();
                            *stop = YES;
                        }
                    }];
                }
            } failureBlock:^(NSError *error) {
                NSLog(@"Error: Cannot load asset from photo stream - %@", [error localizedDescription]);
                failureBlock();
            }];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Error: Cannot load asset - %@", [error localizedDescription]);
        failureBlock();
    }];
}

@end
