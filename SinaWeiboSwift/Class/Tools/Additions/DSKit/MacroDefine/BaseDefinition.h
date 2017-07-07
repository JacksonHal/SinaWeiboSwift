//
//  BaseDefinition.h
//
//
//  Created by FengDongsheng on 14-10-21.
//  Copyright (c) 2014年 All rights reserved.
//


#ifndef BaseDefinition_h
#define BaseDefinition_h

#ifdef DEBUG
#define DLog(format, ...)  NSLog(format, ## __VA_ARGS__)
#else
#define DLog(format, ...)
#endif

//-------------------获取设备大小-------------------------

//获取屏幕 宽度、高度
#define SCREEN_WIDTH                                  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                                 ([UIScreen mainScreen].bounds.size.height)
#define ViewWidth(v)                                  v.frame.size.width
#define ViewHeight(v)                                 v.frame.size.height
#define ViewX(v)                                      v.frame.origin.x
#define ViewY(v)                                      v.frame.origin.y

//-------------------获取设备大小-------------------------


//----------------------系统----------------------------

//获取系统版本
#define IOS_VERSION                                   [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion                          [[UIDevice currentDevice] systemVersion]

//获取当前语言
#define CurrentLanguage                               ([[NSLocale preferredLanguages] objectAtIndex:0])

//当前应用的版本号
#define CurrentAppVersion                             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//获取应用名称
#define APP_NAME                                      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

//判断是否 Retina屏、设备是否iphone5、是否是iPad
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iphone7Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad                                         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif

//检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                   ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)               ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)   ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)      ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


//----------------------系统----------------------------


//主要单例
#define UserDefaults                                [NSUserDefaults standardUserDefaults]
#define NotificationCenter                          [NSNotificationCenter defaultCenter]
#define SharedApplication                           [UIApplication sharedApplication]
#define Bundle                                      [NSBundle mainBundle]
#define MainScreen                                  [UIScreen mainScreen]

//Application delegate
#define ApplicationDelegate                         ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//网络指示
#define ShowNetworkActivityIndicator()              [UIApplication sharedApplication].networkActivityIndicatorVisible = YES
#define HideNetworkActivityIndicator()              [UIApplication sharedApplication].networkActivityIndicatorVisible = NO

//----------------------内存----------------------------

//使用ARC和不使用ARC
#if __has_feature(objc_arc)
//compiling with ARC
#else
// compiling without ARC
#endif

#pragma mark - common functions
#define RELEASE_SAFELY(__POINTER) { [__POINTER release]; __POINTER = nil; }

//释放一个对象
#define SAFE_DELETE(P) if(P) { [P release], P = nil; }

#define SAFE_RELEASE(x) [x release];x=nil



//----------------------内存----------------------------


//----------------------图片----------------------------

//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
//#define LOADIMAGE(file, ext)  iPhone5 ? [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-568h@2x", file] ofType:ext]] : [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:ext]]
//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(fileName) [UIImage imageNamed:fileName]

//建议使用前两种宏定义,性能高于后者
//----------------------图片----------------------------



//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#pragma mark - color functions
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//----------------------其他----------------------------

//方正黑体简体字体定义
#define FONT(F) [UIFont fontWithName:@"FZHTJW--GB1-0" size:F]
//微软雅黑简体字体定义
#define MSYHFONT(F) [UIFont fontWithName:@"MicrosoftYaHei" size:F]
//#define MSYHBDFONT(F) [UIFont fontWithName:@"MicrosoftYaHei-Bold" size:F]

//设置View的tag属性
#define VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]
//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)

//获取字典的key对应的String value
#define DSStringValue(x) x == nil ? @"":x

//单例化一个类
#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
static classname *shared##classname = nil; \
\
+ (classname *)shared##classname \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [[self alloc] init]; \
} \
} \
\
return shared##classname; \
} \
\
+ (id)allocWithZone:(NSZone *)zone \
{ \
@synchronized(self) \
{ \
if (shared##classname == nil) \
{ \
shared##classname = [super allocWithZone:zone]; \
return shared##classname; \
} \
} \
\
return nil; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return self; \
}

#endif
