//
//  DSDesOperation.m
//  Demo
//
//  Created by FengDongsheng on 12/7/25.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSDesOperation.h"
#import <CommonCrypto/CommonCrypto.h>
#import "GTMBase64.h"
#import "GTMDefines.h"

@implementation DSDesOperation

//加密
+ (NSString *)encryptUseDES:(NSString*)plainText key:(NSString *)key isHaveRandomNumber:(BOOL)randomFlag{
    NSString *ciphertext = nil;
    const char *textBytes = [plainText UTF8String];
    NSUInteger dataLength = [plainText length];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    CCCryptorStatus cryptStatus;
    size_t numBytesEncrypted = 0;
    if (randomFlag) {
        Byte iv[] = {1,2,3,4,5,6,7,8};
        cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                              kCCOptionPKCS7Padding,
                                              [key UTF8String], kCCKeySizeDES,
                                              iv,
                                              textBytes, dataLength,
                                              buffer, 1024,
                                              &numBytesEncrypted);
    }else{
        cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                              kCCOptionPKCS7Padding | kCCOptionECBMode,
                                              [key UTF8String], kCCKeySizeDES,
                                              nil,
                                              textBytes, dataLength,
                                              buffer, dataLength + kCCBlockSizeAES128,
                                              &numBytesEncrypted);
    }
    
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesEncrypted];
        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
    }
    return ciphertext;
}

//解密
+ (NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key isHaveRandomNumber:(BOOL)randomFlag{
    NSData* cipherData = [GTMBase64 decodeString:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus;
    if (randomFlag) {
        Byte iv[] = {1,2,3,4,5,6,7,8};
        cryptStatus = CCCrypt(kCCDecrypt,
                              kCCAlgorithmDES,
                              kCCOptionPKCS7Padding,
                              [key UTF8String],
                              kCCKeySizeDES,
                              iv,
                              [cipherData bytes],
                              [cipherData length],
                              buffer,
                              1024,
                              &numBytesDecrypted);
    }else{
        cryptStatus = CCCrypt(kCCDecrypt,
                              kCCAlgorithmDES,
                              kCCOptionPKCS7Padding | kCCOptionECBMode,
                              [key UTF8String],
                              kCCKeySizeDES,
                              nil,
                              [cipherData bytes],
                              [cipherData length],
                              buffer,
                              [cipherData length] + kCCBlockSizeAES128,
                              &numBytesDecrypted);
    }
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}
@end
