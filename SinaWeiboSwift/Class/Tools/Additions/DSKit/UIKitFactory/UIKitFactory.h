//
//  UIKitFactory.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 16/1/20.
//  Copyright © 2016年 FengDongsheng. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIKitFactory : NSObject

/**
*  生成UILabel
*
*  @param frame     位置
*  @param text      文字
*  @param font      字体大小
*  @param textColor 字体颜色
*  @param alignment 文字排布
*  @param superView 父试图
*
*  @return UILabel
*/
+ (UILabel *)createLabelWithFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)alignment SuperView:(UIView *)superView;

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
+ (UILabel *)createRightTopIndexLabelWithSize:(CGSize)size tag:(NSInteger)tag borderWidth:(CGFloat)borderWidth borderColor:(CGColorRef)borderColor text:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor SuperView:(UIView *)superView;

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
+ (UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title setImage:(NSString *)imgName setBgImg:(NSString *)imgBgName font:(UIFont *)font titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)bgColor SuperView:(UIView *)superView;

/**
 *  生成UIView
 *
 *  @param frame          位置
 *  @param bgColor        背景颜色
 *  @param superView      父试图
 *
 *  @return UIView
 */
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor superView:(UIView *)superView;

/**
 *  生成UIImageView
 *
 *  @param frame          位置
 *  @param imageName      图片名字
 *  @param superView      父试图
 *
 *  @return UIImageView
 */
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName superView:(UIView *)superView;

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
+ (UIImageView *)bgImageViewWithNoData:(NSMutableArray *)arrDataResult frame:(CGRect)frame strNoDataImage:(NSString *)strNoDataImage superView:(UIView *)superView;

/**
 *  生成view 用于生成左边图片的UITextField
 *  @param frame        左边view的frame
 *  @param strImageName 左边图片
 *
 *  @return UIView
 */
+ (UIView *)leftViewWithFrame:(CGRect)frame LeftImage:(NSString *)strImageName;

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
+ (CAShapeLayer*)shapDottedLineHeight:(CGFloat)Height lineColor:(UIColor *)lineColor  lineBreakWidth:(int)lineBreakWidth lineBreakMargin:(int)lineBreakMargin originX:(CGFloat)originX originY:(CGFloat)originY lineWidth:(CGFloat)lineWidth superView:(UIView *)superView;

@end
