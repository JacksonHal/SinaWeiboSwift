//
//  DSProgressView.h
//  Demo
//  自定义ProgressView
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSProgressView : UIView
{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, assign) CGFloat progress;//0~1之间的数

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
