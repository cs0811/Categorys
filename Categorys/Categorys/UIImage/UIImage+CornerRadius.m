//
//  UIImage+CornerRadius.m
//  Test
//
//  Created by tongxuan on 16/9/27.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UIImage+CornerRadius.h"

@implementation UIImage (CornerRadius)

- (UIImage *)imageWithCornerRadius:(float)cornerRadius {
    return [self imageWithCornerRadius:cornerRadius inRect:CGRectMake(0, 0, self.size.width, self.size.height)];
}

- (UIImage *)imageWithCornerRadius:(float)cornerRadius inRect:(CGRect)rect {
    UIImage * img = nil;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef currnetContext = UIGraphicsGetCurrentContext();
    CGContextAddPath(currnetContext, [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius].CGPath);
    CGContextClip(currnetContext);
    [self drawInRect:rect];
    img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (!img) {
        img = self;
    }
    
    return img;
}

#pragma mark - 自定义算法切圆角
// 自定义裁剪算法
+ (UIImage *)dealImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius {
    // 1.CGDataProviderRef 把 CGImage 转 二进制流
    CGDataProviderRef provider = CGImageGetDataProvider(image.CGImage);
    void *imgData = (void *)CFDataGetBytePtr(CGDataProviderCopyData(provider));
    int width = image.size.width * image.scale;
    int height = image.size.height * image.scale;
    
    // 2.处理 imgData
    //    dealImage(imgData, width, height);
    cornerImage(imgData, width, height, cornerRadius);
    
    // 3.CGDataProviderRef 把 二进制流 转 CGImage
    CGDataProviderRef pv = CGDataProviderCreateWithData(NULL, imgData, width * height * 4, releaseData);
    CGImageRef content = CGImageCreate(width , height, 8, 32, 4 * width, CGColorSpaceCreateDeviceRGB(), kCGBitmapByteOrder32Big | kCGImageAlphaPremultipliedLast, pv, NULL, true, kCGRenderingIntentDefault);
    UIImage *result = [UIImage imageWithCGImage:content];
    CGDataProviderRelease(pv);      // 释放空间
    CGImageRelease(content);
    
    return result;
}

void releaseData(void *info, const void *data, size_t size) {
    free((void *)data);
}

// 在 img 上处理图片, 测试用
void dealImage(UInt32 *img, int w, int h) {
    int num = w * h;
    UInt32 *cur = img;
    for (int i=0; i<num; i++, cur++) {
        UInt8 *p = (UInt8 *)cur;
        // RGBA 排列
        // f(x) = 255 - g(x) 求负片
        p[0] = 255 - p[0];
        p[1] = 255 - p[1];
        p[2] = 255 - p[2];
        p[3] = 255;
    }
}

// 裁剪圆角
void cornerImage(UInt32 *const img, int w, int h, CGFloat cornerRadius) {
    CGFloat c = cornerRadius;
    CGFloat min = w > h ? h : w;
    
    if (c < 0) { c = 0; }
    if (c > min * 0.5) { c = min * 0.5; }
    
    // 左上 y:[0, c), x:[x, c-y)
    for (int y=0; y<c; y++) {
        for (int x=0; x<c-y; x++) {
            UInt32 *p = img + y * w + x;    // p 32位指针，RGBA排列，各8位
            if (isCircle(c, c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    // 右上 y:[0, c), x:[w-c+y, w)
    int tmp = w-c;
    for (int y=0; y<c; y++) {
        for (int x=tmp+y; x<w; x++) {
            UInt32 *p = img + y * w + x;
            if (isCircle(w-c, c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    // 左下 y:[h-c, h), x:[0, y-h+c)
    tmp = h-c;
    for (int y=h-c; y<h; y++) {
        for (int x=0; x<y-tmp; x++) {
            UInt32 *p = img + y * w + x;
            if (isCircle(c, h-c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
    // 右下 y~[h-c, h), x~[w-c+h-y, w)
    tmp = w-c+h;
    for (int y=h-c; y<h; y++) {
        for (int x=tmp-y; x<w; x++) {
            UInt32 *p = img + y * w + x;
            if (isCircle(w-c, h-c, c, x, y) == false) {
                *p = 0;
            }
        }
    }
}

// 判断点 (px, py) 在不在圆心 (cx, cy) 半径 r 的圆内
static inline bool isCircle(float cx, float cy, float r, float px, float py) {
    if ((px-cx) * (px-cx) + (py-cy) * (py-cy) > r * r) {
        return false;
    }
    return true;
}

// 其他图像效果可以自己写函数，然后在 dealImage: 中调用 otherImage 即可
void otherImage(UInt32 *const img, int w, int h) {
    // 自定义处理
}

#pragma mark -

@end
