//
//  ApplicationUtil.m
//  Demo
//
//  Created by FengDongsheng on 12/12/8.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "ApplicationUtil.h"
#import <CoreLocation/CoreLocation.h>

@interface ApplicationUtil()

@property (strong, nonatomic) UIWebView *mainWebView;

@end

@implementation ApplicationUtil

+ (instancetype)sharedApplicationUtil{
    static ApplicationUtil *sharedApplicationUtil = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedApplicationUtil = [[ApplicationUtil alloc] init];
    });
    return sharedApplicationUtil;
}


//拨打电话
- (void)makeTelephoneCall:(NSString *)telNumber{
    static const NSInteger telTag = 19009527;
    NSString *str = [NSString stringWithFormat:@"tel:%@",telNumber];
    if (!_mainWebView) {
        _mainWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
        _mainWebView.tag = telTag;
    }
    [self.mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    UIView *tempView = [SharedApplication.keyWindow viewWithTag:telTag];
    if (tempView) {
        [tempView removeFromSuperview];
    }
    [SharedApplication.keyWindow addSubview:self.mainWebView];
}

//注册push通知
- (void)registerNotification{
    if (IOS_VERSION >= 8.0){//ios8 通知设置改变
        UIUserNotificationSettings *notificationSettings = [UIUserNotificationSettings settingsForTypes: UIUserNotificationTypeSound
                                                            | UIUserNotificationTypeAlert
                                                            | UIUserNotificationTypeBadge
                                                                                             categories:nil];
        [SharedApplication registerUserNotificationSettings:notificationSettings];
        [[UIApplication sharedApplication] currentUserNotificationSettings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }else{
        [SharedApplication registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge
         | UIRemoteNotificationTypeSound
         | UIRemoteNotificationTypeAlert];
    }
}

//是否开启了定位服务
- (BOOL)bIsOpenLocationService{
    BOOL bOpenLocation;
    CLAuthorizationStatus status=[CLLocationManager authorizationStatus];
    if (![CLLocationManager locationServicesEnabled]    ||
        status == kCLAuthorizationStatusRestricted  ||
        status == kCLAuthorizationStatusDenied
        ){
        bOpenLocation=NO;
    }else{
        bOpenLocation=YES;
    }
    return bOpenLocation;
}

/**
 *  跳转到系统设置页面，iOS8之后可用
 */
- (void)gotoSettings{
    if (&UIApplicationOpenSettingsURLString != NULL) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: UIApplicationOpenSettingsURLString]];
    }
}
@end
