//
//  UIButton+ButtonSwizzle.m
//  Demo
//
//  Created by FengDongsheng on 12/6/1.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "UIButton+ButtonSwizzle.h"
#import "NSObject+Swizzle.h"

@implementation UIButton (ButtonSwizzle)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      SEL init = @selector(init);
                      SEL init_t = @selector(init_t);
                      SEL initWithCoder = @selector(initWithCoder:);
                      SEL initWithCoder_t = @selector(initWithCoder_t:);
                      SEL initWithFrame = @selector(initWithFrame:);
                      SEL initWithFrame_t = @selector(initWithFrame_t:);
                      
                      [self swizzleInstanceSelector:init withNewSelector:init_t];
                      [self swizzleInstanceSelector:initWithCoder withNewSelector:initWithCoder_t];
                      [self swizzleInstanceSelector:initWithFrame withNewSelector:initWithFrame_t];
                  });
}

- (id)initWithCoder_t:(NSCoder *)aDecoder
{
    id wself = [self initWithCoder_t:aDecoder];
    [wself setExclusiveTouch:YES];
    return wself;
}

- (id)initWithFrame_t:(CGRect)frame
{
    id wself = [self initWithFrame_t:frame];
    [wself setExclusiveTouch:YES];
    return wself;
}

- (id)init_t
{
    id wself = [self init_t];
    [wself setExclusiveTouch:YES];
    return wself;
}

@end
