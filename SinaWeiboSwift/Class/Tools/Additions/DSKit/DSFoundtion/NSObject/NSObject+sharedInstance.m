//
//  NSObject+sharedInstance.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/9/22.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSObject+sharedInstance.h"
#import <objc/runtime.h>

@implementation NSObject (sharedInstance)

+ (id)sharedInstance{
    Class selfClass = [self class];
    id instance = objc_getAssociatedObject(selfClass, @"DSSharedInstance");
    if (!instance)
    {
        instance = [[selfClass alloc] init];
        objc_setAssociatedObject(selfClass, @"DSSharedInstance", instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return instance;
}

+ (void)freeSharedInstance{
    Class selfClass = [self class];
    objc_setAssociatedObject(selfClass, @"DSSharedInstance", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
