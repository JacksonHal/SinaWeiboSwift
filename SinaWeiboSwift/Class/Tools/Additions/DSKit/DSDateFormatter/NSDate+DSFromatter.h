//
//  NSDate+DSFromatter.h
//  Demo
//
//  Created by FengDongsheng on 12/5/29.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DSFromatter)

- (NSString *)stringWithDateFormat:(NSString *)dateFormat;

/**
 *	@brief	按yyyy－MM－dd EE进行输出
 *
 *	@return	如果是昨天/今天/明天/后天 就显示 yyyy－MM－dd 昨天/今天/明天/后天
 不然则显示 yyyy－MM－dd EE
 */
- (NSString *)dateToDSCustom;

/**
 * 计算指定时间与当前的时间差
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
- (NSString *)stringBeforeDate;

/**
 *  将当前日期转换成新的格式的日期
 *
 *  @param dateFormat 日期格式
 *
 *  @return 新日期
 */
- (NSDate *)convertDateToNewDateFormat:(NSString *)dateFormat;
@end
