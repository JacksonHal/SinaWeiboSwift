//
//  NSObject+sharedInstance.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/9/22.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (sharedInstance)

/**
 *  创建单例
 *
 *  @return 单例
 */
+ (id)sharedInstance;

/**
 *  释放单例
 */
+ (void)freeSharedInstance;

@end
