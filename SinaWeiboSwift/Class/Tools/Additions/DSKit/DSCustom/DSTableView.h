//
//  DSTableView.h
//  Standand
//
//  Created by FengDongsheng on 12/8/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSTableView : UITableView

/**
 *  当数据为空或者无网络时设置背景图片
 *
 *  @param strNodataImage    无数据时的图片
 *  @param strNoNetworkImage 无网络时的图片
 */
- (void)setupWithNodataImage:(NSString*)strNodataImage andNoNetworkImage:(NSString*)strNoNetworkImage;

@end
