//
//  UIColor+Addition.m
//  SinaWeiboSwift
//
//  Created by 郝好杰 on 2017/7/9.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)hj_RGBColor:(UInt32)rgbValue {
    UIColor *rgbColor = [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];
    return rgbColor;
}

@end
