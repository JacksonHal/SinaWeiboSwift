//
//  DSCircleView.h
//  Demo
//
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSCircleView : UIView{
    UIBezierPath *bezierPath;
    CAShapeLayer *trackLayer;
}

@property (strong, nonatomic) UIColor *centerColor;//中心颜色
@property (strong, nonatomic) UIColor *outerColor;//外圈颜色
@property (assign, nonatomic) CGFloat outerWidth;//外圈宽度


@end
