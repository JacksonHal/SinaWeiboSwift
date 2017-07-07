//
//  NSString+Calculate.h
//  Demo
//
//  Created by FengDongsheng on 12/6/1.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Calculate)

- (unsigned long)RGBValue;

/**
 * Determines if the string contains only whitespace.
 */
- (BOOL)isWhitespace;

- (NSString *)URLEncodedString;

- (NSString *)URLDecodedString;

/**
 * Determines if the string is empty or contains only whitespace.
 */
- (BOOL)isEmptyOrWhitespace;

/*
 * Checks to see if the string contains the given string, case insenstive
 */
- (BOOL)containsString:(NSString*)string;

/*
 * Checks to see if the string contains the given string while allowing you to define the compare options
 */
- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options;

/*
 * Returns the MD5 value of the string
 */
- (NSString*)md5;

/*
 * return the sha1 digest of the string
 */
- (NSString*)sha1;

/*
 * return the sha1 digest of the data
 */
- (NSData*)sha1_data;

- (NSString *)checkLengthWithString:(NSString *)_str;

- (CGSize)sizeWithFontCustom:(UIFont *)font
           constrainedToSize:(CGSize)size
               lineBreakMode:(int)lineBreakMode;


-(CGSize)sizeWithFontCustom:(UIFont *)font
          constrainedToSize:(CGSize)size;

-(CGSize)sizeWithFontCustom:(UIFont *)font;
+ (NSString *)GUIDString;

+ (NSString *)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options replaceArray:(NSArray *)_replaceArray;

+ (NSDictionary*)dictionaryFromQuery:(NSString*)query usingEncoding:(NSStringEncoding)encoding;

- (NSString *)trimmingWhitespace;

- (NSString *)trimmingWhitespaceAndNewlines;

/**
 *  判断是否是手机号
 *
 *  @param phoneNum 手机号码
 *
 *  @return 是否是手机号码
 */
- (BOOL)phoneNumberByRegex:(NSString *)phoneNum;

/**
 *  校验是否是合法邮箱
 *
 *  @param strEmail 邮箱号
 *
 *  @return 是否是可用邮箱
 */
- (BOOL)isValitadeEmail:(NSString *)strEmail;

/**
 *  转换成金额格式化，三位加一个逗号
 *
 *  @return 格式化后的字符串
 */
- (NSString*)stringToFormatCurrencyString;

@end
