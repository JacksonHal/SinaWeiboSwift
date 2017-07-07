//
//  DSFormatter.m
//  Demo
//
//  Created by FengDongsheng on 12/5/29.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSFormatter.h"

@implementation DSFormatter
+ (NSDateFormatter *)sharedDateFormatter
{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = NSDateFormatter.new;
        [instance setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:8]];
    });
    return instance;
}
@end
