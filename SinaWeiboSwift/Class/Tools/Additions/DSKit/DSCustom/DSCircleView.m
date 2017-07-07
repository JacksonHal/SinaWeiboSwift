//
//  DSCircleView.m
//  Demo
//
//  Created by FengDongsheng on 12/7/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSCircleView.h"

@implementation DSCircleView

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
        trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:trackLayer];
        trackLayer.frame = self.bounds;
        
        //创建path
        bezierPath = [UIBezierPath bezierPath];
        // 添加圆到path
        [bezierPath addArcWithCenter:self.center radius:(frame.size.width/2 -10) startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
        
        trackLayer.path = bezierPath.CGPath;
        trackLayer.fillColor = [UIColor blueColor].CGColor;
        trackLayer.strokeColor = [UIColor redColor].CGColor;
        trackLayer.lineWidth = 20.0;
        [self.layer addSublayer:trackLayer];
    }
    return self;
}

- (void)setCenterColor:(UIColor *)centerColor{
    trackLayer.fillColor = centerColor.CGColor;
}

- (void)setOuterColor:(UIColor *)outerColor{
    trackLayer.strokeColor = outerColor.CGColor;
}

- (void)setOuterWidth:(CGFloat)outerWidth{
    trackLayer.lineWidth = outerWidth;
    bezierPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.frame.size.width/2 - outerWidth/2) startAngle:0 endAngle:M_PI*2 clockwise:YES];
    trackLayer.path = bezierPath.CGPath;
}
@end
