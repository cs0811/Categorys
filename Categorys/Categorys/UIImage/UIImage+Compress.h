//
//  UIImage+Compress.h
//  iWedding
//
//  Created by v2m on 14-1-9.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Compress)

-(NSData*)compressedData;
-(UIImage*)imageMinEdgeFitManLength:(float)length;

@end
