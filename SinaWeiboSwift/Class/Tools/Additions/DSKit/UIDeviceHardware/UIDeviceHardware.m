//
//  UIDeviceHardware.m
//
//
//  Created by DS.
//
//


#import "UIDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#import <sys/sysctl.h>

@implementation UIDeviceHardware
+ (NSString *) platform {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    free(machine);
    return platform;
}
+ (NSString *) platformString {
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4V";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 plus";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad2 Wifi";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad2 GSM 3G";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad2 CDMA 3G";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad New";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad New";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad New";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch";
    if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch";
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"])         return@"iPhone Simulator";
    return platform;
}
@end
