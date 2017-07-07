//
//  NSNumber+ChineseNumber.m
//  Demo
//
//  Created by FengDongsheng on 12/6/1.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSNumber+ChineseNumber.h"

@implementation NSNumber (ChineseNumber)

+(NSString *)NumberToChineseNumber:(NSInteger)_i{
    NSString *str=[NSNumber NumberToChineseNumber:_i Index:0];
    return str;//[str stringByReplacingOccurrencesOfString:@"一十" withString:@"十"];
}

+(NSString *)NumberToChineseNumber:(NSInteger)integer Index:(NSInteger)index{
    if (integer<=0) {
        return @"";
    }
    else if (integer/10==0){
        return [NSNumber getChineseNumberByInteger:integer];
    }
    else if (integer%10==0) {
        return [NSString stringWithFormat:@"%@%@",[NSNumber NumberToChineseNumber:integer/10 Index:index+1],[NSNumber getUnitByIndex:index]];
    }
    else{
        return [NSString stringWithFormat:@"%@%@%@",[NSNumber NumberToChineseNumber:integer/10 Index:index+1],[NSNumber getUnitByIndex:index],[NSNumber getChineseNumberByInteger:integer%10]];
    }
}

+(NSString *)getUnitByIndex:(NSInteger)index{
    if (index%7==0&&index>0) {
        return @"亿";
    }
    switch (index%4) {
        case 0:return @"十";break;
        case 1:return @"百";break;
        case 2:return @"千";break;
        case 3:return @"万";break;
    }
    return @"";
}

+(NSString *)getChineseNumberByInteger:(NSInteger)index{
    switch (index) {
        case 1:return @"一";break;
        case 2:return @"二";break;
        case 3:return @"三";break;
        case 4:return @"四";break;
        case 5:return @"五";break;
        case 6:return @"六";break;
        case 7:return @"七";break;
        case 8:return @"八";break;
        case 9:return @"九";break;
    }
    return @"";
}

@end
