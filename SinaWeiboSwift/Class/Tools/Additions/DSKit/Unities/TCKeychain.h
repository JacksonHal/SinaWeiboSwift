//
//  TCKeychain.h
//
//
//  Created by FengDongsheng on 14-8-27.
//
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>


@interface TCKeychain : NSObject

+ (void)setObject:(id)anObject forKey:(NSString*)key;//保存
+ (id)getObjectForKey:(NSString *)key;//获取
+ (void)removeObjectForKey:(NSString *)key;//删除 

@end
