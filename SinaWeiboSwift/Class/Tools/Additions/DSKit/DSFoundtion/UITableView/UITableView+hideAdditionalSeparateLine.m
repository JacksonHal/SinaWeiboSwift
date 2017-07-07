//
//  UITableView+hideAdditionalSeparateLine.m
//  Wealthy
//
//  Created by FengDongsheng on 12/6/19.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "UITableView+hideAdditionalSeparateLine.h"

@implementation UITableView (hideAdditionalSeparateLine)

/**
 *  隐藏多余的分割线，用自定义footer实现
 */
- (void)hideAdditionalSeparateLine{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
    v.backgroundColor = [UIColor whiteColor];
    [self setTableFooterView:v];
}

@end
