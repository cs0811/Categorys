//
//  UIImageView+ShowImageAnimation.m
//  Test
//
//  Created by tongxuan on 16/8/20.
//  Copyright © 2016年 tongxuan. All rights reserved.
//

#import "UIImageView+ShowImageAnimation.h"
#import <objc/runtime.h>

static const char isSetImageFormSDwebImageKey;
static const char cancelAnimationKeyKey;

@implementation UIImageView (ShowImageAnimation)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setImage:);
        SEL swizzledSelector = @selector(HLJsetImage:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
            
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
        
        
        SEL originalSDWebImageSel = @selector(sd_setImageWithURL:placeholderImage:options:progress:completed:);
        SEL swizzledSDWebImageSel = @selector(HLJsd_setImageWithURL:placeholderImage:options:progress:completed:);
        
        Method originalSDWebImageMethod = class_getInstanceMethod(class, originalSDWebImageSel);
        Method swizzledSDWebImageMethod = class_getInstanceMethod(class, swizzledSDWebImageSel);
        
        BOOL didAddSDWebImageMethod =
        class_addMethod(class,
                        originalSDWebImageSel,
                        method_getImplementation(swizzledSDWebImageMethod),
                        method_getTypeEncoding(swizzledSDWebImageMethod));
        
        if (didAddSDWebImageMethod) {
            class_replaceMethod(class,
                                swizzledSDWebImageSel,
                                method_getImplementation(originalSDWebImageMethod),
                                method_getTypeEncoding(originalSDWebImageMethod));
            
        } else {
            method_exchangeImplementations(originalSDWebImageMethod, swizzledSDWebImageMethod);
        }
        
    });
}

#pragma mark swizzledSel
- (void)HLJsetImage:(UIImage *)image {
    
    if ([self isSetImageFormSDwebImage] && !self.cancelImageAnimation && !self.image) {
        if (!self.maskView) {
            UIView * tempView = [UIView new];
            tempView.backgroundColor = [UIColor lightGrayColor];
            tempView.frame = self.bounds;
            tempView.alpha = 0;
            self.maskView = tempView;
        }else {
            self.maskView.alpha = 0;
        }
        
        [UIView animateWithDuration:1 animations:^{
            self.maskView.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }
    
    [self HLJsetImage:image];
}

- (void)HLJsd_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDWebImageCompletionBlock)completedBlock {
    
    [self  setIsSetImageFormSDwebImage:YES];
    
    [self HLJsd_setImageWithURL:url placeholderImage:placeholder options:SDWebImageDelayPlaceholder progress:progressBlock completed:completedBlock];
}

#pragma mark getter-setter
- (BOOL)isSetImageFormSDwebImage {
    return [objc_getAssociatedObject(self, &isSetImageFormSDwebImageKey) boolValue];
}
- (void)setIsSetImageFormSDwebImage:(BOOL)isSetImageFormSDwebImage {
    objc_setAssociatedObject(self, &isSetImageFormSDwebImageKey, @(isSetImageFormSDwebImage), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)cancelImageAnimation {
    return [objc_getAssociatedObject(self, &cancelAnimationKeyKey) boolValue];
}
- (void)setCancelImageAnimation:(BOOL)cancelImageAnimation {
    objc_setAssociatedObject(self, &cancelAnimationKeyKey, @(cancelImageAnimation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
