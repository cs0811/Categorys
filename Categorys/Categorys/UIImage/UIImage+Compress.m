//
//  UIImage+Compress.m
//  iWedding
//
//  Created by v2m on 14-1-9.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import "UIImage+Compress.h"
#import <ImageIO/ImageIO.h>

const float kMaxPixelSize = 1024.0;

@implementation UIImage (Compress)

-(NSData *)compressedData
{
    UIImage* image = self;
    
    // 如果 最大边 / 1024 >= 2,那么压缩到 1024 * 1024 以内
    float maxEdgeLength = MAX(self.size.width, self.size.height);
    float rate = maxEdgeLength / kMaxPixelSize;
    if (rate > 1.9999) {
        CGImageSourceRef src = CGImageSourceCreateWithData((__bridge CFDataRef)(UIImageJPEGRepresentation(self, 1.0)), nil);
        
        NSDictionary* options = @{(id)kCGImageSourceShouldAllowFloat : (id)kCFBooleanTrue,
                                  (id)kCGImageSourceCreateThumbnailWithTransform : (id)kCFBooleanFalse,
                                  (id)kCGImageSourceCreateThumbnailFromImageIfAbsent : (id)kCFBooleanTrue,
                                  (id)kCGImageSourceThumbnailMaxPixelSize : [NSNumber numberWithDouble:maxEdgeLength / (floorf(rate))]
                                  };
        
        CGImageRef thumbnail = CGImageSourceCreateThumbnailAtIndex(src, 0, (__bridge CFDictionaryRef)options);
        
        image = [UIImage imageWithCGImage:thumbnail scale:1 orientation:self.imageOrientation];
        CGImageRelease(thumbnail);
        CFRelease(src);
    }
    
    // 压缩 70% 或者 300k 以内
    CGFloat compression = 1.0f;
    CGFloat maxCompression = 0.7f;
    int maxFileSize = 300 * 1024;
    
    NSData *imageData = UIImageJPEGRepresentation(image, compression);
    
    while ([imageData length] > maxFileSize && compression > maxCompression)
    {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    return imageData;
}

-(UIImage*)imageMinEdgeFitManLength:(float)length
{
    UIImage* image = self;
    
    // 如果 最大边 / 1024 >= 2,那么压缩到 1024 * 1024 以内
    float rate = MIN(self.size.width, self.size.height) / length;
    if (rate > 1.0) {
        CGImageSourceRef src = CGImageSourceCreateWithData((__bridge CFDataRef)(UIImageJPEGRepresentation(self, 1.0)), nil);
        
        NSDictionary* options = @{(id)kCGImageSourceShouldAllowFloat : (id)kCFBooleanTrue,
                                  (id)kCGImageSourceCreateThumbnailWithTransform : (id)kCFBooleanFalse,
                                  (id)kCGImageSourceCreateThumbnailFromImageIfAbsent : (id)kCFBooleanTrue,
                                  (id)kCGImageSourceThumbnailMaxPixelSize : [NSNumber numberWithDouble:(MAX(self.size.height, self.size.width) / rate)]
                                  };
        
        CGImageRef thumbnail = CGImageSourceCreateThumbnailAtIndex(src, 0, (__bridge CFDictionaryRef)options);
        
        image = [UIImage imageWithCGImage:thumbnail];
        CGImageRelease(thumbnail);
        CFRelease(src);
    }
    
    return image;
}

@end
