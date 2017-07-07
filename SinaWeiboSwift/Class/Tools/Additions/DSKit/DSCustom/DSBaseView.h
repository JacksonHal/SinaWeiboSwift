//
//  DSBaseView.h
//  Demo
//
//  Created by FengDongsheng on 12/6/3.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSBaseView : UIView

/**
 *  在隐藏键盘的时候发现APP进入后台再进入前台的时候，点击键盘键盘没有响应，导致无法输入，为了解决这个问题，在applicationWillEnterForeground方法里需要调用此方法，参考链接http://stackoverflow.com/questions/8072984/hittest-fires-when-uikeyboard-is-tapped
 */
+ (void)prepareForHideKeyBoard;

@end
