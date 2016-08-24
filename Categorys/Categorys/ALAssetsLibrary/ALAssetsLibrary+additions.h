//
//  ALAssetsLibrary+additions.h
//  iWedding
//
//  Created by 项元智 on 15/3/16.
//  Copyright (c) 2015年 suncloud. All rights reserved.
//

#import <AssetsLibrary/AssetsLibrary.h>

@interface ALAssetsLibrary (additions)
-(void)assetForURLEx:(NSURL *)assetURL withSuccessBlock:(void (^)(ALAsset*))successBlock failureBlock:(void (^)(void))failureBlock;
@end
