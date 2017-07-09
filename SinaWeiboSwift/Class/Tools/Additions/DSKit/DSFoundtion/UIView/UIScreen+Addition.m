//
//  UIScreen+Addition.m
//  SinaWeiboSwift
//
//  Created by 郝好杰 on 2017/7/9.
//  Copyright © 2017年 好杰. All rights reserved.
//

#import "UIScreen+Addition.h"

@implementation UIScreen (Addition)

//获取屏幕的宽度
+ (CGFloat)hj_ScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

//获取屏幕的高度
+ (CGFloat)hj_ScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

@end
