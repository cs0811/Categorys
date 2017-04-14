//
//  UIImageView+starRank.m
//  QuicklyShop
//
//  Created by S on 15/8/25.
//  Copyright (c) 2015年 com. All rights reserved.
//

#import "UIImageView+starRank.h"
#import <objc/runtime.h>

static char kSpaceLeft;
static char kSpaceRight;
static char kSpaceH;
static char kStarRank;
static char kMaxStarCount;
static char kGrayStarImg;
static char kHalfStarImg;
static char kWholeStarImg;

@implementation UIImageView (starRank)

- (void)setStarRank:(CGFloat)starRank {
    if (starRank < 0 ) {
        starRank = 0.;
    }
    
    if ([self starRank] == starRank && self.image) {
        return;
    }
    
    objc_setAssociatedObject(self, &kStarRank, @(starRank), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    CGSize size = self.bounds.size;
    
    CGFloat space = self.spaceH;                 // 星星之间间距
    CGFloat width1 = (size.width-space*(self.maxStarCount-1)-self.spaceLeft-self.spaceRight)/self.maxStarCount;        // 星星的宽
    CGFloat width = width1>size.height ? size.height : width1;
    
    dispatch_queue_t starQueue = dispatch_queue_create("createStarImgQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(starQueue, ^{
        UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
        
        UIImage * baseImage = [UIImage imageNamed:self.grayStarImg];
        for (int a=0; a<5; a++) {   // 灰色星星
            [baseImage drawInRect:CGRectMake(self.spaceLeft+(width+space)*a, (size.height-width)/2, width, width)];
        }
        
        UIImage * image = [UIImage imageNamed:self.wholeStarImg];
        int b=0;
        for (b=0; b<floorf(starRank); b++) {      // 黄色星星
            [image drawInRect:CGRectMake(self.spaceLeft+(width+space)*b, (size.height-width)/2, width, width)];
        }
        
        UIImage * imageHalf = [UIImage imageNamed:self.halfStarImg];
        if (imageHalf) {
            if (starRank<ceilf(starRank) && starRank>floorf(starRank)) {        // 半颗星
                [imageHalf drawInRect:CGRectMake(self.spaceLeft+(width+space)*b, (size.height-width)/2, width, width)];
            }
        }
        
        UIImage * returnImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = returnImage;
        });
    });
}

#pragma mark getter
- (CGFloat)starRank {
    return [objc_getAssociatedObject(self, &kStarRank) floatValue];
}
- (void)setSpaceLeft:(CGFloat)spaceLeft {
    if (spaceLeft < 0) {
        spaceLeft = 5.;
    }
    objc_setAssociatedObject(self, &kSpaceLeft, @(spaceLeft), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)spaceLeft {
    return [objc_getAssociatedObject(self, &kSpaceLeft) floatValue];
}
- (void)setSpaceRight:(CGFloat)spaceRight {
    if (spaceRight < 0) {
        spaceRight = 5.;
    }
    objc_setAssociatedObject(self, &kSpaceRight, @(spaceRight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)spaceRight {
    return [objc_getAssociatedObject(self, &kSpaceRight) floatValue];
}
- (void)setSpaceH:(CGFloat)spaceH {
    if (spaceH < 0) {
        spaceH = 5.;
    }
    objc_setAssociatedObject(self, &kSpaceH, @(spaceH), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (CGFloat)spaceH {
    return [objc_getAssociatedObject(self, &kSpaceH) floatValue];
}
- (void)setMaxStarCount:(NSInteger)maxStarCount {
    if (maxStarCount < 1) {
        maxStarCount = 1;
    }
    objc_setAssociatedObject(self, &kMaxStarCount, @(maxStarCount), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSInteger)maxStarCount {
    return [objc_getAssociatedObject(self, &kMaxStarCount) integerValue];
}
- (void)setHalfStarImg:(NSString *)halfStarImg {
    objc_setAssociatedObject(self, &kHalfStarImg, halfStarImg, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)halfStarImg {
    return objc_getAssociatedObject(self, &kHalfStarImg);
}
- (void)setGrayStarImg:(NSString *)grayStarImg{
    objc_setAssociatedObject(self, &kGrayStarImg, grayStarImg, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)grayStarImg {
    return objc_getAssociatedObject(self, &kGrayStarImg);
}
- (void)setWholeStarImg:(NSString *)wholeStarImg {
    objc_setAssociatedObject(self, &kWholeStarImg, wholeStarImg, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)wholeStarImg {
    return objc_getAssociatedObject(self, &kWholeStarImg);
}

@end
