//
//  DSCacheManager.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/11/30.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSCacheManager : NSObject

/**
 *  把图片写入沙盒
 *
 *  @param image     图片
 *  @param imageName 图片名称
 */
+ (void)writToFileByImage:(UIImage *)image withImageName:(NSString *)imageName;

/**
 *  从沙盒缓存中获取图片
 *
 *  @param imageName 图片名称
 *
 *  @return 图片
 */
+ (UIImage *)getFileByImage:(NSString *)imageName;

@end
