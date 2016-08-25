//
//  UITextField+additions.m
//  iWedding
//
//  Created by 项元智 on 14-10-8.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import "UITextField+additions.h"

@implementation UITextField (additions)
-(void)limitTextLength:(int)maxLength countLabel:(UILabel*)countLabel
{
    bool isChinese;
    if ([[[UIApplication sharedApplication]textInputMode].primaryLanguage isEqualToString: @"en-US"]) {
        isChinese = false;
    }
    else
    {
        isChinese = true;
    }
    
    NSString *str = self.text;
    if (isChinese) {
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if ( str.length>maxLength) {
                [self setText:[str substringToIndex:maxLength]];
            }
            if(countLabel) {
                countLabel.text = [NSString stringWithFormat:@"%lu",maxLength - self.text.length];
            }
        }
        else {
            //NSLog(@"输入的英文还没有转化为汉字的状态");
        }
    } else {
        if (str.length>maxLength) {
            [self setText:[str substringToIndex:maxLength]];
        }
        if(countLabel) {
            countLabel.text = [NSString stringWithFormat:@"%lu",maxLength - self.text.length];
        }
    }
}
@end
