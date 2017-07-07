//
//  DSTableView.m
//  Standand
//
//  Created by FengDongsheng on 12/8/21.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSTableView.h"
#import "DSNetWorkStatus.h"
@interface DSTableView()

@property (nonatomic, strong) UIImage *imgNoData;//没有数据时的背景图片
@property (nonatomic, strong) UIImage *imgNoNetwork;//没有网络时的背景图片
@property (nonatomic, strong) UIImageView *imvBgDefault;//异常情况下显示默认图片

@end
@implementation DSTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setupWithNodataImage:(NSString*)strNodataImage andNoNetworkImage:(NSString*)strNoNetworkImage{
    self.imgNoData = [UIImage imageNamed:strNodataImage];
    self.imgNoNetwork = [UIImage imageNamed:strNoNetworkImage];
}

- (void)reloadData{
    [super reloadData];
    NSInteger sections = [self numberOfSections];
    BOOL hasRows = NO;
    for (int i = 0; i < sections; i++) {
        BOOL sectionHasRows = ([self numberOfRowsInSection:i] > 0) ? YES : NO;
        if (sectionHasRows) {
            hasRows = YES;
            break;
        }
    }
    
    if (sections == 0 || hasRows == NO)
    {
        UIImage *imgTemp;
        if ([DSNetWorkStatus sharedNetWorkStatus].netWorkStatus == NotReachable) {
            if (!self.imgNoNetwork) {
                self.imgNoNetwork = [UIImage imageNamed:@"emptyNoNetwork"];
            }
            imgTemp = self.imgNoNetwork;
        }else{
            if (!self.imgNoData) {
                self.imgNoData = [UIImage imageNamed:@"emptyNoCustomer"];
            }
            imgTemp = self.imgNoData;
        }
        
        if (!_imvBgDefault) {
            _imvBgDefault = [[UIImageView alloc] initWithImage:imgTemp];
            // Add image view on top of table view
            [self addSubview:_imvBgDefault];
        }
        self.imvBgDefault.frame = CGRectMake(0, 0, imgTemp.size.width, imgTemp.size.height);
        self.imvBgDefault.center = CGPointMake(self.center.x, self.center.y - 80);
        self.imvBgDefault.hidden = NO;
    }else{
        if (_imvBgDefault) {
            self.imvBgDefault.hidden = YES;
        }
    }
}
@end
