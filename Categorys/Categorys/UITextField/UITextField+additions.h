//
//  UITextField+additions.h
//  iWedding
//
//  Created by 项元智 on 14-10-8.
//  Copyright (c) 2014年 suncloud. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (additions)
-(void)limitTextLength:(int)maxLength countLabel:(UILabel*)countLabel;
@end
