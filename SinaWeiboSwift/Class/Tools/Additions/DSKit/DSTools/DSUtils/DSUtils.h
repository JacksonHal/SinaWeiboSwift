//
//  DSUtils.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/8/8.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface DSUtils : NSObject

/**
 *  生成固定长度的随机字符串
 *
 *  @param iLength 长度
 *
 *  @return 随机字符串
 */
+ (NSString *)generateRandomStringWithLength:(NSInteger)iLength;

/**
 *  判断字符串是否是电话号码
 *
 *  @param phoneNum 字符串
 *
 *  @return 是否是电话号码
 */
+ (BOOL)isPhoneNumberByRegex:(NSString *)phoneNum;

/**
 *  判断字符串是否是邮箱
 *
 *  @param strEmail 字符串
 *
 *  @return 是否是邮箱
 */
+ (BOOL)isValitadeEmail:(NSString *)strEmail;

/**
 *  判断是否是合法的银行卡号
 *
 *  @return 是否是银行卡号
 */
+ (BOOL)isBankCardNumber:(NSString *)strCardNo;


/**
 *  生成设备的UUID，iOS6之后可用
 *
 *  @return uuid字符串
 */
+ (NSString *)getUUIDString;//NS_AVAILABLE_IOS(6_0)

/**
 *  获取当前显示的viewcontroller
 *
 *  @return return 当前显示的vc
 */
+ (UIViewController *)obtainTopViewController;

/**
 *  根据根vc获取最上层vc
 *
 *  @param rootViewController 根vc
 *
 *  @return 最上层vc
 */
+ (UIViewController*)obtainTopViewControllerWithRootViewController:(UIViewController*)rootViewController;

@end
