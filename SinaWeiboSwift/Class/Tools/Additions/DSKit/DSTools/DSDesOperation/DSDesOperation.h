//
//  DSDesOperation.h
//  Demo
//
//  Created by FengDongsheng on 12/7/25.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSDesOperation : NSObject

/**
 *  对NSString进行des加密
 *
 *  @param plainText  要加密的字符串
 *  @param key        加密的key
 *  @param randomFlag 加密时是否要包含随机数
 *
 *  @return 加密后的字符串
 */
+ (NSString *)encryptUseDES:(NSString*)plainText key:(NSString *)key isHaveRandomNumber:(BOOL)randomFlag;

/**
 *  解密字符串
 *
 *  @param cipherText 密文字符串
 *  @param key        加密的key
 *  @param randomFlag 加密时是否要包含随机数
 *
 *  @return 解密后的字符串
 */
+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key isHaveRandomNumber:(BOOL)randomFlag;
@end
