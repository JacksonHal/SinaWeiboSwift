//
//  NSString+Calculate.m
//  Demo
//
//  Created by FengDongsheng on 12/6/1.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSString+Calculate.h"
#import "CommonCrypto/CommonDigest.h"

@implementation NSString (Calculate)
- (unsigned long)RGBValue
{
    NSString *color;
    if (self.length == 6) {
        color = [NSString stringWithFormat:@"0x%@", self];
    } else if (self.length == 8 && [self hasPrefix:@"0x"]) {
        color = self;
    } else {
        return 0;
    }
    return strtoul([color UTF8String], 0, 16);
}

- (BOOL)isWhitespace {
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c]) {
            return NO;
        }
    }
    return YES;
}

- (BOOL)isEmptyOrWhitespace {
    return !self.length ||
    ![self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length;
}

- (NSString *)URLEncodedString
{
    
    //    NSString *result = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
    //                                                                           (CFStringRef)self,
    //                                                                           NULL,
    //                                                                           CFSTR("!*'();:@&=+$,/?%#[]"),
    //                                                                           kCFStringEncodingUTF8);
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                             (CFStringRef)self,
                                                                                             NULL,
                                                                                             CFSTR("!*'();:@&=+$,/?%#[]"),
                                                                                             kCFStringEncodingUTF8));
    return result;
}

- (NSString*)URLDecodedString
{
    //    NSString *result = (NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
    //                                                                                           (CFStringRef)self,
    //                                                                                           CFSTR(""),
    //                                                                                           kCFStringEncodingUTF8);
    
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(kCFAllocatorDefault,
                                                                                                             (CFStringRef)self,
                                                                                                             CFSTR(""),
                                                                                                             kCFStringEncodingUTF8));
    return result;
}

- (BOOL)containsString:(NSString*)string {
    return [self containsString:string options:NSCaseInsensitiveSearch];
}

- (BOOL)containsString:(NSString*)string options:(NSStringCompareOptions)options {
    return [self rangeOfString:string options:options].location == NSNotFound ? NO : YES;
}

/*
 * We did not write the method below
 * It's all over Google and we're unable to find the original author
 * Please contact info@enormego.com with the original author and we'll
 * Update this comment to reflect credit
 */
- (NSString*)md5
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, @(strlen(original_str)).unsignedIntValue, result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    return [hash lowercaseString];
}



- (NSString*)sha1 {
    const char* string = [self UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];   // 20
    CC_SHA1(string, @(strlen(string)).unsignedIntValue, result);
    NSString* hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
                      result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
                      result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15],
                      result[16], result[17], result[18], result[19]];
    
    return [hash lowercaseString];
}

- (NSData*)sha1_data {
    const char* string = [self UTF8String];
    unsigned char result[CC_SHA1_DIGEST_LENGTH];   // 20
    CC_SHA1(string, @(strlen(string)).unsignedIntValue, result);
    NSData *data = [NSData dataWithBytes:result length:20];
    return data;
}

- (NSString *)checkLengthWithString:(NSString *)_str{
    if (self.length>0) {
        return _str;
    }else{
        return @"";
    }
}
/**
 *  用于计算显示多行文字
 *
 *  @param font          字体
 *  @param size          size
 *  @param lineBreakMode linbreakmode
 *
 *  @return CGSize 返回
 */
-(CGSize)sizeWithFontCustom:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(int)lineBreakMode
{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect frame = [self boundingRectWithSize:size
                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributesDictionary context:nil];
    return CGSizeMake(round(frame.size.width+0.5), round(frame.size.height+0.5));
}


-(CGSize)sizeWithFontCustom:(UIFont *)font constrainedToSize:(CGSize)size
{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGRect frame = [self boundingRectWithSize:size
                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin
                                   attributes:attributesDictionary context:nil];
    return CGSizeMake(round(frame.size.width+0.5), round(frame.size.height+0.5));
}

-(CGSize)sizeWithFontCustom:(UIFont *)font
{
    NSDictionary *attributesDictionary = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    CGSize frame = [self sizeWithAttributes:attributesDictionary];
    return CGSizeMake(round(frame.width+0.5), round(frame.height+0.5));
}


+ (NSString *)GUIDString
{
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    NSString *str = (__bridge NSString *)(string);
    CFRelease(string);
    return str;
}

/**
 *  字符串筛选,去掉不需要的特殊字符串
 *  //maxfong友情辅助
 *  使用方法:replaceOccurrencesOfString:@"1(2*3" withString:@"" options:2 replaceArray:[NSArray arrayWithObjects:@"(",@"*", nil]
 输出:123
 *
 *  @param target        原字符串
 *  @param replacement   需要替换的字符串
 *  @param options       默认传2:NSLiteralSearch,区分大小写
 *  @param _replaceArray 需要排除的Array
 *
 *  @return 筛选后的字符串
 */
+ (NSString *)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options replaceArray:(NSArray *)_replaceArray
{
    NSMutableString *tempStr = [NSMutableString stringWithString:target];
    NSArray *replaceArray = [NSArray arrayWithArray:_replaceArray];
    for(int i = 0; i < [replaceArray count]; i++){
        NSRange range = [target rangeOfString:[replaceArray objectAtIndex:i]];
        if(range.location != NSNotFound){
            [tempStr replaceOccurrencesOfString:[replaceArray objectAtIndex:i]
                                     withString:replacement
                                        options:options
                                          range:NSMakeRange(0, [tempStr length])];
        }
    }
    return tempStr;
}

//NSURL解析地址里面各参数值
+ (NSDictionary*)dictionaryFromQuery:(NSString*)query usingEncoding:(NSStringEncoding)encoding
{
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:query];
    while (![scanner isAtEnd])
    {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString* key = [[kvPair objectAtIndex:0]
                             stringByReplacingPercentEscapesUsingEncoding:encoding];
            NSString* value = [[kvPair objectAtIndex:1]
                               stringByReplacingPercentEscapesUsingEncoding:encoding];
            [pairs setObject:value forKey:key];
        }
    }
    
    return [NSDictionary dictionaryWithDictionary:pairs];
}

- (NSString *)trimmingWhitespace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)trimmingWhitespaceAndNewlines{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)phoneNumberByRegex:(NSString *)phoneNum{
    if (phoneNum && phoneNum.length > 0) {
        
    }else{
        return NO;
    }
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phoneNum];
}

- (BOOL)isValitadeEmail:(NSString *)strEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:strEmail];
}

/**
 *  转换成金额格式化，三位加一个逗号
 *
 *  @return 格式化后的字符串
 */
- (NSString*)stringToFormatCurrencyString{
    if (self && self.length > 0) {
        NSDecimalNumber *num = [NSDecimalNumber decimalNumberWithString:self];
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        [formatter setAllowsFloats:YES];
        [formatter setMinimumFractionDigits:2];
        [formatter setMaximumFractionDigits:2];
        [formatter setAlwaysShowsDecimalSeparator:YES];
        [formatter setGeneratesDecimalNumbers:YES];
        NSString *formattedOutput = [formatter stringFromNumber:num];
        return formattedOutput;
    }
    return @"";
}
@end
