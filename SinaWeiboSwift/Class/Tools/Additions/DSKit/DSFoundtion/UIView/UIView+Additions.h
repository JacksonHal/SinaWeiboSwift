//
//  UIView+Additions.h
//  MLIPhone
//
//  Created by yakehuang on 5/10/14.
//
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

// 设置边距
- (void)setOriginX:(CGFloat)originX originY:(CGFloat)originY;
- (void)setOriginX:(CGFloat)originX;
- (void)setOriginY:(CGFloat)originY;

// 设置高宽
- (void)setWidth:(CGFloat)width height:(CGFloat)height;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;

// 移除所有子view
- (void)removeAllSubViews;

// 找到第一响应者，移除
- (BOOL)findAndResignFirstResponder;
- (UIView *)findFirstResponder;

// 获得所属控制器
- (UIViewController*)viewController;
- (void)showLoading:(NSString *)word;
@end
