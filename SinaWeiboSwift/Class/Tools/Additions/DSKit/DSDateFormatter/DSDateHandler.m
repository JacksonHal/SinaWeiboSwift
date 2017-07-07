//
//  DSDateHandler.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/7/30.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSDateHandler.h"

@implementation DSDateHandler

+ (NSString *)stringRemindingTimeWithInterval:(NSTimeInterval)timeInterval{
    if (timeInterval > 0) {
        NSInteger iDays;
        NSInteger iHours;
        NSInteger iMinutes;
        NSInteger iSeconds;
        iDays = timeInterval/3600/24;
        timeInterval = timeInterval - iDays*24*3600;
        iHours = timeInterval/3600;
        timeInterval = timeInterval - iHours*3600;
        iMinutes = timeInterval/60;
        timeInterval = timeInterval - iMinutes*60;
        iSeconds = timeInterval;
        
        NSString *strRemindingTime = [NSString stringWithFormat:@"%@天%@时%@分%@秒",[NSNumber numberWithInteger:iDays],[NSNumber numberWithInteger:iHours],[NSNumber numberWithInteger:iMinutes],[NSNumber numberWithInteger:iSeconds]];
        return strRemindingTime;
    }
    return @"";
}

@end
