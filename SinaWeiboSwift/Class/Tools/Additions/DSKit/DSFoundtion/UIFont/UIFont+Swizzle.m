//
//  UIFont+Swizzle.m
//  Shanghaitong
//
//  Created by FengDongsheng on 12/9/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "UIFont+Swizzle.h"
#import <objc/runtime.h>
static NSString *const kFontName = @"FZLTXHK--GBK1-0";

@implementation UIFont (Swizzle)

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        SEL fontWithNameSizeSelector = @selector(systemFontOfSize:);
//        SEL swizzledFontWithNameSizeSelector = @selector(SwisystemFontOfSize:);
//        SwizzleClassMethod([UIFont class], fontWithNameSizeSelector, swizzledFontWithNameSizeSelector);
//    });
//}
//
//void SwizzleClassMethod(Class class, SEL originalSelector, SEL replacementSelector)
//{
//    Class clazz = objc_getMetaClass(class_getName(class));
//    
//    Method originalMethod = class_getClassMethod(clazz, originalSelector);
//    Method replacementMethod = class_getClassMethod(clazz, replacementSelector);
//    
//    // Add method if it doesn't eixst
//    BOOL didAddMethod =
//    class_addMethod(clazz,
//                    originalSelector,
//                    method_getImplementation(replacementMethod),
//                    method_getTypeEncoding(replacementMethod));
//    
//    
//    if (didAddMethod) {
//        class_replaceMethod(clazz,
//                            replacementSelector,
//                            method_getImplementation(originalMethod),
//                            method_getTypeEncoding(originalMethod));
//    } else {
//        method_exchangeImplementations(originalMethod, replacementMethod);
//    }
//}
//
//+(UIFont *)SwisystemFontOfSize:(CGFloat)size{
//    return [UIFont systemFontOfSize:size];
//}
@end
