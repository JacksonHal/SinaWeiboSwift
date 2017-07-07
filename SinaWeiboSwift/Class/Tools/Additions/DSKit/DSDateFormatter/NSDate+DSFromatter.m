//
//  NSDate+DSFromatter.m
//  Demo
//
//  Created by FengDongsheng on 12/5/29.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSDate+DSFromatter.h"
#import "NSString+DSDateFormatter.h"
#import "DSFormatter.h"

@implementation NSDate (DSFromatter)

- (NSString *)stringWithDateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [DSFormatter sharedDateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:self];
}

-(NSString *)dateToDSCustom{
    NSTimeInterval timeInterval = [self timeIntervalSinceDate:[[[NSDate date] stringWithDateFormat:@"yyyy-MM-dd"] dateWithDateFormat:@"yyyy-MM-dd"]];
    switch ((int)timeInterval / (24*3600) )
    {
        case 0:
        {
            if (timeInterval >= 0) {
                return [NSString stringWithFormat:@"%@ 今天", [self stringWithDateFormat:@"MM-dd"]];
            }
            else
            {
                return [NSString stringWithFormat:@"%@ 昨天",[self stringWithDateFormat:@"MM-dd"]];
            }
        }
            break;
        case 1:
        {
            if (timeInterval >= 0) {
                return [NSString stringWithFormat:@"%@ 明天",[self stringWithDateFormat:@"MM-dd"]];
            }
            else
            {
                return [NSString stringWithFormat:@"%@ 前天",[self stringWithDateFormat:@"MM-dd"]];
            }
        }
            break;
        case 2:
        {
            if (timeInterval >= 0) {
                return [NSString stringWithFormat:@"%@ 后天",[self stringWithDateFormat:@"MM-dd"]];
            }
            else
            {
                return [self stringWithDateFormat:@"MM-dd EE"];
            }
        }
            break;
        default:
            break;
    }
    return [self stringWithDateFormat:@"MM-dd EE"];
}

- (NSString *)stringBeforeDate{
    NSTimeInterval timeInterval = [self timeIntervalSinceNow];
    timeInterval = -timeInterval;
    int temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60) {
        result = [NSString stringWithFormat:@"%d分前",temp];
    }
    else if((temp = temp/60) < 24) {
        result = [NSString stringWithFormat:@"%d小前",temp];
    }
    
    else if((temp = temp/24) < 30) {
        result = [NSString stringWithFormat:@"%d天前",temp];
    }
    
    else if((temp = temp/30) < 12) {
        result = [NSString stringWithFormat:@"%d月前",temp];
    }
    else {
        temp = temp/12;
        result = [NSString stringWithFormat:@"%d年前",temp];
    }
    return result;
}

- (NSDate *)convertDateToNewDateFormat:(NSString *)dateFormat {
    if ([dateFormat length] > 0) {
        NSString *covertDateString = [self stringWithDateFormat:dateFormat];
        NSDate *convertDate = [covertDateString dateWithDateFormat:dateFormat];
        return convertDate;
    }
    else {
        return self;
    }
}

@end
