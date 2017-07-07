//
//  DSNetWorkStatus.h
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/7/25.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSReachability.h"

@interface DSNetWorkStatus : NSObject

@property (nonatomic) NetworkStatus netWorkStatus;

+ (instancetype)sharedNetWorkStatus;

@end
