//
//  UIKitFactory.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 16/1/20.
//  Copyright © 2016年 FengDongsheng. All rights reserved.
//


#import "UIKitFactory.h"

@implementation UIKitFactory

/**
 *  生成UILabel
 *
 *  @param frame          位置
 *  @param text           文字
 *  @param font           字体大小
 *  @param titleColor     字体颜色
 *  @param superView      父试图
 *
 *  @return UILabel
 */
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)alignment SuperView:(UIView *)superView{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = alignment;
    [superView addSubview:label];
    return label;
}

/**
 *  生成控件的右上角的图标
 *
 *  @param frame       位置
 *  @param tag         tag值
 *  @param borderWidth 外边框的宽度
 *  @param borderColor 外边框的颜色
 *  @param text        文字
 *  @param font        字体的大小
 *  @param textColor   字体颜色
 *  @param superView   父视图
 *
 *  @return UILabel
 */
+ (UILabel *)createRightTopIndexLabelWithSize:(CGSize)size tag:(NSInteger)tag borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor SuperView:(UIView *)superView{
    CGFloat w = size.height/2;
    CGRect superFrame = superView.frame;
    CGFloat x = CGRectGetWidth(superFrame)-10;
    CGFloat y = -2;
    CGFloat height = size.height;
    CGFloat width;
    if (text.length == 1) {
        width = size.width;
    } else if (text.length == 2){
        width = size.width*1.5;
    } else {
        width = size.width*2;
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(x, y, width, height)];
    label.backgroundColor = [UIColor whiteColor];
    label.layer.cornerRadius = w;
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = borderWidth;
    label.layer.borderColor = borderColor;
    
    label.text = text;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = NSTextAlignmentCenter;
    [superView addSubview:label];
    return label;
}

/**
 *  生成UIButton
 *
 *  @param frame          位置
 *  @param title          标题
 *  @param imgName        图片名字
 *  @param imgBgName      背景图片名字
 *  @param font           字体大小
 *  @param titleColor     字体颜色
 *  @param bgColor        背景颜色
 *  @param superView      父试图
 *
 *  @return UIButton
 */
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title setImage:(NSString *)imgName setBgImg:(NSString *)imgBgName font:(UIFont *)font titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)bgColor SuperView:(UIView *)superView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.backgroundColor = bgColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setBackgroundImage:[UIImage imageNamed:imgBgName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    [superView addSubview:btn];
    return btn;
    
}

/**
 *  生成UIView
 *
 *  @param frame          位置
 *  @param bgColor        背景颜色
 *  @param superView      父试图
 *
 *  @return UIView
 */

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor superView:(UIView *)superView{
    UIView *v = [[UIView alloc]initWithFrame:frame];
    v.backgroundColor = bgColor;
    [superView addSubview:v];
    return  v;
}

/**
 *  生成UIImageView
 *
 *  @param frame          位置
 *  @param imageName      图片名字
 *  @param superView      父试图
 *
 *  @return UIImageView
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName superView:(UIView *)superView{
    UIImageView *imv = [[UIImageView alloc]initWithFrame:frame];
    [imv setImage:[UIImage imageNamed:imageName]];
    [superView addSubview:imv];
    return imv;
}

/**
 *  无数据时的背景图片
 *
 *  @param arrDataResult  返回结果
 *  @param frame          位置
 *  @param strNoDataImage 无数据提示图片名字
 *  @param superView      父试图
 *
 *  @return UIImageView
 */
+ (UIImageView *)bgImageViewWithNoData:(NSMutableArray *)arrDataResult frame:(CGRect)frame strNoDataImage:(NSString *)strNoDataImage superView:(UIView *)superView{
    if (arrDataResult.count > 0) {
        UIImageView *imvBg = [[UIImageView alloc]initWithFrame:frame];
        [imvBg setImage:[UIImage imageNamed:strNoDataImage]];
        [superView addSubview:imvBg];
        return imvBg;
    }else{
        return nil;
    }
}

/**
 *  生成view 用于生成左边图片的UITextField
 *  @param frame        左边view的frame
 *  @param strImageName 左边图片
 *
 *  @return UIView
 */
+ (UIView *)leftViewWithFrame:(CGRect)frame LeftImage:(NSString *)strImageName{
    UIView *leftView = [[UIView alloc]initWithFrame:frame];
    UIImage *imgIcon = [UIImage imageNamed:strImageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgIcon.size.width, imgIcon.size.height)];
    imageView.center = leftView.center;
    imageView.image = imgIcon;
    [leftView addSubview:imageView];
    return leftView;
}

/**
 *  画虚线
 *
 *  @param Width           线宽
 *  @param lineColor       线条颜色
 *  @param originX         起始位置x
 *  @param originY         起始位置y
 *  @param lineBreakWidth  虚线每段宽度
 *  @param lineBreakMargin 虚线之间的间距
 *  @param superView       父试图
 *
 *  @return UITextField
 */
+ (CAShapeLayer*)shapDottedLineWidth:(CGFloat)Width lineColor:(UIColor *)lineColor  lineBreakWidth:(int)lineBreakWidth lineBreakMargin:(int)lineBreakMargin originX:(CGFloat)originX originY:(CGFloat)originY superView:(UIView *)superView{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:superView.bounds];
    [shapeLayer setPosition:superView.center];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:Width];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:lineBreakWidth],
      [NSNumber numberWithInt:lineBreakMargin],nil]];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, originX, originY);
    CGPathAddLineToPoint(path, NULL, [UIScreen mainScreen].bounds.size.width,originY);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[superView layer] addSublayer:shapeLayer];
    
    return shapeLayer;
}

/**
 *  画虚线
 *
 *  @param Height          线高
 *  @param lineColor       线条颜色
 *  @param originX         起始位置x
 *  @param originY         起始位置y
 *  @param lineWidth       虚线的宽度
 *  @param lineBreakWidth  虚线每段宽度
 *  @param lineBreakMargin 虚线之间的间距
 *  @param superView       父试图
 *
 *  @return CAShapeLayer
 */
+ (CAShapeLayer*)shapDottedLineHeight:(CGFloat)Height lineColor:(UIColor *)lineColor  lineBreakWidth:(int)lineBreakWidth lineBreakMargin:(int)lineBreakMargin originX:(CGFloat)originX originY:(CGFloat)originY lineWidth:(CGFloat)lineWidth superView:(UIView *)superView{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:superView.bounds];
    [shapeLayer setPosition:superView.center];
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [shapeLayer setStrokeColor:lineColor.CGColor];
    
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:Height];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:
     [NSArray arrayWithObjects:[NSNumber numberWithInt:lineBreakWidth],
      [NSNumber numberWithInt:lineBreakMargin],nil]];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, originX, originY);
    CGPathAddLineToPoint(path, NULL, originX + lineWidth,originY);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[superView layer] addSublayer:shapeLayer];
    
    return shapeLayer;
    
}
@end
