//
//  UIColor+Addition.h
//  SinaWeiboSwift
//
//  Created by 郝好杰 on 2017/7/9.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)


/**
 rgb颜色转换（16进制->10进制）

 @param rgbValue rgbValue
 @return UIColor
 */
+ (UIColor *)hj_RGBColor:(UInt32)rgbValue;

@end
