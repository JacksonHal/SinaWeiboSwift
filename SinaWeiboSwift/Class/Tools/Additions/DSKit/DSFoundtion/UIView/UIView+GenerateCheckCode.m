//
//  UIView+GenerateCheckCode.m
//  Demo
//
//  Created by FengDongsheng on 12/6/2.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "UIView+GenerateCheckCode.h"
#import "NSString+Calculate.h"
#import <objc/runtime.h>

@implementation UIView (GenerateCheckCode)

- (void)generateCheckCode{
    [self generateCode];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *gestureTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(generateCode)];
    [self addGestureRecognizer:gestureTap];
}

- (void)generateCode{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // @{
    // @name 生成背景色
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:0.2];
    [self setBackgroundColor:color];
    // @} end 生成背景色
    
    // @{
    // @name 生成文字
    NSInteger count = 5;
    char data[count];
    for (int x = 0; x < count; x++) {
        int j = '0' + (arc4random_uniform(75));
        if((j >= 58 && j <= 64) || (j >= 91 && j <= 96)){
            --x;
        }else{
            data[x] = (char)j;
        }
    }
    NSString *text = [[NSString alloc] initWithBytes:data
                                              length:count encoding:NSUTF8StringEncoding];
    NSString *strCheckCode = text;
    // @} end 生成文字
    
    CGSize cSize = [@"S" sizeWithFontCustom:[UIFont systemFontOfSize:16]];
    int width = self.frame.size.width / text.length - cSize.width;
    int height = self.frame.size.height - cSize.height;
//    CGPoint point;
    float pX, pY;
    count = text.length;
    for (int i = 0; i < count; i++) {
        pX = arc4random() % width + self.frame.size.width / text.length * i - 1;
        pY = arc4random() % height;
//        point = CGPointMake(pX, pY);
        unichar c = [text characterAtIndex:i];
        UILabel *tempLabel = [[UILabel alloc]
                              initWithFrame:CGRectMake(pX, pY,
                                                       self.frame.size.width - pX,
                                                       self.frame.size.height - pY)];
        tempLabel.backgroundColor = [UIColor clearColor];
        
        // 字体颜色
        float red = arc4random() % 100 / 100.0;
        float green = arc4random() % 100 / 100.0;
        float blue = arc4random() % 100 / 100.0;
        UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        
        NSString *textC = [NSString stringWithFormat:@"%C", c];
        tempLabel.textColor = color;
        tempLabel.font = [UIFont boldSystemFontOfSize:25];
        tempLabel.text = textC;
        [self addSubview:tempLabel];
    }
    
    // 干扰线
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    for(int i = 0; i < count; i++) {
        red = arc4random() % 100 / 100.0;
        green = arc4random() % 100 / 100.0;
        blue = arc4random() % 100 / 100.0;
        color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        CGContextSetStrokeColorWithColor(context, [color CGColor]);
        pX = arc4random() % (int)self.frame.size.width;
        pY = arc4random() % (int)self.frame.size.height;
        CGContextMoveToPoint(context, pX, pY);
        pX = arc4random() % (int)self.frame.size.width;
        pY = arc4random() % (int)self.frame.size.height;
        CGContextAddLineToPoint(context, pX, pY);
        CGContextStrokePath(context);
    }
    
    //设置验证码属性，供view使用
    [self setCheckCode:strCheckCode];
}

static char checkCodeKey;
- (void)setCheckCode:(NSString *) _checkCode{
    objc_setAssociatedObject(self, &checkCodeKey, _checkCode, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)getCheckCode{
    return objc_getAssociatedObject(self, &checkCodeKey);
}
@end
