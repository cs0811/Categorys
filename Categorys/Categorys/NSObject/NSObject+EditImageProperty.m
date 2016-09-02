//
//  NSObject+EditImageProperty.m
//  HLJTest
//
//  Created by tongxuan on 16/9/2.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "NSObject+EditImageProperty.h"
#import <ImageIO/ImageIO.h>

@implementation NSObject (EditImageProperty)

- (NSData *)editImage:(UIImage *)image toDPI:(float)dpi {
    NSData * imageNSData = UIImagePNGRepresentation(image);
    
    CGImageSourceRef imgSource = CGImageSourceCreateWithData((__bridge_retained CFDataRef)imageNSData, NULL);
    NSDictionary * metadata = (__bridge NSDictionary *)CGImageSourceCopyPropertiesAtIndex(imgSource, 0, NULL);

    NSMutableDictionary * metadataAsMutable = [metadata mutableCopy];
    [metadataAsMutable setValue:@(dpi) forKey:(NSString *)kCGImagePropertyDPIWidth];
    [metadataAsMutable setValue:@(dpi) forKey:(NSString *)kCGImagePropertyDPIHeight];
    
    CFStringRef UTI = CGImageSourceGetType(imgSource);
    NSMutableData *newImageData = [NSMutableData data];
    
    CGImageDestinationRef destination = CGImageDestinationCreateWithData((__bridge CFMutableDataRef)newImageData, UTI, 1, NULL);
    CGImageDestinationAddImageFromSource(destination, imgSource, 0, (__bridge CFDictionaryRef) metadataAsMutable);
    
    BOOL success = NO;
    success = CGImageDestinationFinalize(destination);
    
    if(!success) {
        return nil;
    }
    
    return newImageData;
}

@end
