//
//  DSDateFormatter.m
//  Demo
//
//  Created by FengDongsheng on 12/5/29.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSDateFormatter.h"
#import "NSDate+DSFromatter.h"
#import "NSString+DSDateFormatter.h"

@implementation DSDateFormatter

+ (NSString *)dateToDSDefault:(NSDate *)_date{
    return [_date dateToDSCustom];
}

+ (NSString *) dateToStringCustom:(NSDate *)date formatString:(NSString *)formatString{
    return [date stringWithDateFormat:formatString];
}

+ (NSDate *)stringToDateCustom:(NSString *)dateString formatString:(NSString *)formatString{
    return [dateString dateWithDateFormat:formatString];
}
@end
