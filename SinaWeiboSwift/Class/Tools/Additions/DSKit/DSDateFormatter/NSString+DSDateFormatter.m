//
//  NSString+DSDateFormatter.m
//  Demo
//
//  Created by FengDongsheng on 12/5/29.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSString+DSDateFormatter.h"
#import "DSFormatter.h"

@implementation NSString (DSDateFormatter)

- (NSDate *)dateWithDateFormat:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [DSFormatter sharedDateFormatter];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:self];
}

@end
