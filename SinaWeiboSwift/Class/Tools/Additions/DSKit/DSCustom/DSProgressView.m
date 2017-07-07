//
//  DSProgressView.m
//  Demo
//
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSProgressView.h"

@implementation DSProgressView

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
        _trackLayer.lineCap = kCALineCapRound;
        _trackLayer.frame = self.bounds;
        _trackLayer.lineWidth = frame.size.height/2;
        
        _progressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.frame = self.bounds;
        _progressLayer.lineWidth = frame.size.height/2;
        
        [self setTrack];
    }
    return self;
}

- (void)setTrack{
    _trackPath = [UIBezierPath bezierPath];
    [_trackPath moveToPoint:CGPointMake(self.frame.size.height/4 , self.frame.size.height/2)];
    [_trackPath addLineToPoint:CGPointMake(self.frame.size.height/2 + self.frame.size.width, self.frame.size.height/2)];
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress{
    _progressPath = [UIBezierPath bezierPath];
    [_progressPath moveToPoint:CGPointMake(self.frame.size.height/4 , self.frame.size.height/2)];
    [_progressPath addLineToPoint:CGPointMake(self.frame.size.height/2 + self.frame.size.width*_progress, self.frame.size.height/2)];
    _progressLayer.path = _progressPath.CGPath;
    _progressLayer.hidden = _progress == 0;
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
