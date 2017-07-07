//
//  HYSegmentedControl.h
//  CustomSegControlView
//
//  Created by sxzw on 14-6-12.
//  Copyright (c) 2014年 sxzw. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HYSegmentedControlDelegate <NSObject>

@required
//代理函数 获取当前下标
- (void)hySegmentedControlSelectAtIndex:(NSInteger)index;

@end

@interface HYSegmentedControl : UIView

@property (assign, nonatomic) id<HYSegmentedControlDelegate>delegate;
@property (copy,   nonatomic) NSArray *arrTitles;

//初始化函数 
- (id)initWithOriginY:(CGFloat)y Titles:(NSArray *)titles delegate:(id)delegate height:(CGFloat)itemHeight selectColor:(UIColor*)sColor normaoColor:(UIColor*)nColor;
//提供方法改变 index
- (void)changeSegmentedControlWithIndex:(NSInteger)index;

@end
