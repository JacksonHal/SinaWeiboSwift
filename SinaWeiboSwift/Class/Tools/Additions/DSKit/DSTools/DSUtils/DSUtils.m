//
//  DSUtils.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/8/8.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//


#import "DSUtils.h"

@implementation DSUtils

+ (NSString *)generateRandomStringWithLength:(NSInteger)iLength{
    char data[iLength];
    for (int x = 0; x < iLength; x++) {
        int j = '0' + (arc4random_uniform(75));
        if((j >= 58 && j <= 64) || (j >= 91 && j <= 96)){
            --x;
        }else{
            data[x] = (char)j;
        }
    }
    NSString *text = [[NSString alloc] initWithBytes:data length:iLength encoding:NSUTF8StringEncoding];
    return text;
}

+ (BOOL)isPhoneNumberByRegex:(NSString *)phoneNum{
    if (phoneNum && phoneNum.length > 0) {
        
    }else{
        return NO;
    }
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phoneNum];
}

+ (BOOL)isValitadeEmail:(NSString *)strEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strEmail];
}



+ (BOOL)isBankCardNumber:(NSString *)strCardNo{
    NSString *numberRegex = @"^[0-9]*$";
    NSPredicate *bankCardNumberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    if (![bankCardNumberPredicate evaluateWithObject:strCardNo]) {
        return NO;
    }
    
    NSInteger sum = 0;
    NSInteger len = [strCardNo length];
    NSInteger i = 0;
    while (i < len) {
        NSString *tmpString = [strCardNo substringWithRange:NSMakeRange(len - 1 - i, 1)];
        int tmpVal = [tmpString intValue];
        if (i % 2 != 0) {
            tmpVal *= 2;
            if(tmpVal>=10) {
                tmpVal -= 9;
            }
        }
        sum += tmpVal;
        i++;
    }
    
    if((sum % 10) == 0)
        return YES;
    else
        return NO;
}

+ (NSString*)getUUIDString{
    NSString *strUUID = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    return strUUID;
}

+ (UIViewController *)obtainTopViewController {
    return [DSUtils obtainTopViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController*)obtainTopViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [DSUtils obtainTopViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [DSUtils obtainTopViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [DSUtils obtainTopViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}
@end
