//
//  UILabel+CurrentNumberOfLines.m
//  HLJUtils
//
//  Created by tongxuan on 2017/4/11.
//  Copyright © 2017年 xyuanzhi. All rights reserved.
//

#import "UILabel+CurrentNumberOfLines.h"

@interface UILabel (CurrentNumberOfLines)
@end

@implementation UILabel (CurrentNumberOfLines)

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth {
    
    NSAttributedString *attributedString = self.attributedText;
    if (!attributedString) {
        NSDictionary *attributes = @{
                                     NSFontAttributeName:self.font?:[UIFont systemFontOfSize:17.],
                                     NSForegroundColorAttributeName:self.textColor?:[UIColor blackColor],
                                     };
        attributedString =  [[NSAttributedString alloc] initWithString:self.text?:@"" attributes:attributes];
    }
    return [self getCurrentNumberOfLinesWithMaxWidth:maxWidth attributedString:attributedString];
}

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth string:(NSString *)string attributes:(NSDictionary *)attributes {
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attributes];
    return [self getCurrentNumberOfLinesWithMaxWidth:maxWidth attributedString:attributedString];
}

- (NSInteger)getCurrentNumberOfLinesWithMaxWidth:(CGFloat)maxWidth attributedString:(NSAttributedString *)attributedString {
    
    if (!attributedString) {
        return 0;
    }
    
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:attributedString];
    
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)];
    textContainer.lineBreakMode = NSLineBreakByWordWrapping;
    textContainer.maximumNumberOfLines = 0;
    textContainer.lineFragmentPadding = 0;
    
    NSLayoutManager *layoutManager = [NSLayoutManager new];
    layoutManager.textStorage = textStorage;
    [layoutManager addTextContainer:textContainer];
    
    NSInteger numberOfLines = 0;
    NSInteger index = 0;
    NSRange lineRange = NSMakeRange(0, 0);
    for (; index < layoutManager.numberOfGlyphs; numberOfLines++) {
        [layoutManager lineFragmentRectForGlyphAtIndex:index effectiveRange:&lineRange];
        index = NSMaxRange(lineRange);
    }
    
    return numberOfLines;
}

@end
