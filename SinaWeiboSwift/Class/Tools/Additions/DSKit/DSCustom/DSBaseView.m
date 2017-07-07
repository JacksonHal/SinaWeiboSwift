//
//  DSBaseView.m
//  Demo
//
//  Created by FengDongsheng on 12/6/3.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSBaseView.h"

@implementation DSBaseView

/**
 *  重写hitTest方法，用于隐藏键盘
 */
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    if (result.tag == 301) {//UITextField 的 clearButton
        
        
    }else{
        [self endEditing:YES];
    }
    return result;
}

+ (void)prepareForHideKeyBoard{
    for (UIWindow *testWindow in [UIApplication sharedApplication].windows) {
        if (!testWindow.opaque && [NSStringFromClass(testWindow.class) hasPrefix:@"UIText"]){
            BOOL wasHidden = testWindow.hidden;
            testWindow.hidden = YES;
            
            if (!wasHidden) {
                testWindow.hidden = NO;
            }
            
            break;
        }
    }
}
@end
