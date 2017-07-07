//
//  DSCircleProgressView.h
//  DSDeveloperKit
//  利用UIBeizerpath 画圆
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSCircleProgressView : UIView{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic, assign) CGFloat progress;//0~1之间的数
@property (nonatomic, assign) CGFloat progressWidth;

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

@end
