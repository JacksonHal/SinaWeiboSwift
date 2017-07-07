//
//  NSObject+InitWithDictionary.h
//  Demo
//
//  Created by FengDongsheng on 12/12/12.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (InitWithDictionary)

/**
 *  根据数据字典解析成对象
 *
 *  @param dict      数据字典
 *  @param classname 对象名称
 *
 *  @return 解析成功的对象
 */
- (instancetype)initWithDict:(id)dict className:(NSString*)classname;

/**
 *  把NSObject转化为NSDictionary
 *
 *  @param obj object对象
 *
 *  @return NSDictionary
 */
- (NSDictionary*)getDictionaryData:(id)obj;
@end
