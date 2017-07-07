//
//  DSCircleProgressView.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSCircleProgressView.h"

@implementation DSCircleProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = nil;
        _trackLayer.frame = self.bounds;
        
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapSquare;
        _progressLayer.frame = self.bounds;
        
        //默认5
        self.progressWidth = 5;
    }
    return self;
}

- (void)setTrack{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:0 endAngle:M_PI * 2 clockwise:YES];;
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}

- (void)setProgressWidth:(CGFloat)progressWidth{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self setTrack];
    [self setProgress];
}

- (void)setTrackColor:(UIColor *)trackColor{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [self setProgress];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated{
    if (animated) {
        CABasicAnimation *_animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
        _animation.duration = 0.8f;
        _animation.delegate = self;
        _animation.fromValue = [NSNumber numberWithInteger:0];
        _animation.toValue = [NSNumber numberWithInteger:1];
        [_progressLayer addAnimation:_animation forKey:@"strokeEnd"];
    }
    _progress = progress;
    [self setProgress];
}


@end
