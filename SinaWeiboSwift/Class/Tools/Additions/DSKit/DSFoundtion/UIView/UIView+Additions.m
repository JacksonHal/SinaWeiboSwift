//
//  UIView+Additions.m
//  MLIPhone
//
//  Created by yakehuang on 5/10/14.
//
//

#import "UIView+Additions.h"

@implementation UIView (Additions)

- (void)setOriginX:(CGFloat)originX originY:(CGFloat)originY{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(originX, originY);
    self.frame = frame;
}

- (void)setOriginX:(CGFloat)originX{
    CGRect frame = self.frame;
    frame.origin.x = originX;
    self.frame = frame;
}

- (void)setOriginY:(CGFloat)originY{
    CGRect frame = self.frame;
    frame.origin.y = originY;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width height:(CGFloat)height{
    CGRect originRect = self.frame;
    CGRect newRect = CGRectMake(originRect.origin.x, originRect.origin.y, width, height);
    self.frame = newRect;
}

- (void)setWidth:(CGFloat)width{
    CGRect originRect = self.frame;
    CGRect newRect = CGRectMake(originRect.origin.x, originRect.origin.y, width, originRect.size.height);
    self.frame = newRect;
}

- (void)setHeight:(CGFloat)height{
    CGRect originRect = self.frame;
    CGRect newRect = CGRectMake(originRect.origin.x, originRect.origin.y, originRect.size.width, height);
    self.frame = newRect;
}

- (void)removeAllSubViews{
    for (UIView *v in [self subviews]) {
        [v removeFromSuperview];
    }
}

- (BOOL)findAndResignFirstResponder{
    if (self.isFirstResponder){
        [self resignFirstResponder];
        return YES;
    }
    
    for (UIView *subView in self.subviews){
        if ([subView findAndResignFirstResponder]){
            return YES;
        }
    }
    
    return NO;
}

- (UIView *)findFirstResponder{
    if (self.isFirstResponder){
        return self;
    }
    
    for (UIView *subView in self.subviews){
        UIView *responder = [subView findFirstResponder];
        if (responder){
            return responder;
        }
    }
    
    return nil;
}

- (UIViewController*)viewController{
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (void)showLoading:(NSString *)word{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = word;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    [label sizeToFit];
    [label setCenter: CGPointMake(self.frame.size.width / 2.0 , self.frame.size.height / 2.0)];
    [label setTextAlignment:NSTextAlignmentCenter];
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(label.frame.origin.x - 20, label.frame.origin.y + 1, 15, 15)];
    [indicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [indicator.layer setValue:[NSNumber numberWithFloat:0.7f]
                   forKeyPath:@"transform.scale"];
    [indicator startAnimating];
    
    [self addSubview:label];
    [self addSubview:indicator];
}

@end
