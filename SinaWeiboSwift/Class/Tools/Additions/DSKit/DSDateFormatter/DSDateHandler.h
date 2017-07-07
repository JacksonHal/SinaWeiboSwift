//
//  DSDateHandler.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/7/30.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSDateHandler : NSObject

/**
 *  计算还剩下多长时间
 *
 *  @return x天x时x分x秒
 */
+ (NSString *)stringRemindingTimeWithInterval:(NSTimeInterval)timeInterval;

@end
