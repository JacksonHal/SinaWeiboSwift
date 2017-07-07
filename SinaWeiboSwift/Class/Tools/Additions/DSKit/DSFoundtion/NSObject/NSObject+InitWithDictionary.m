//
//  NSObject+InitWithDictionary.m
//  Demo
//
//  Created by FengDongsheng on 12/12/12.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "NSObject+InitWithDictionary.h"
#import <objc/runtime.h>

@implementation NSObject (InitWithDictionary)

- (instancetype)initWithDict:(id)dict className:(NSString*)classname {
    @synchronized (self) {
        if (!dict)
            return self;
        unsigned int propCount=0;
        Class c = objc_getClass([classname cStringUsingEncoding:NSUTF8StringEncoding]);
        objc_property_t *properties = class_copyPropertyList([c class], &propCount);
        for (int j =0 ; j < propCount ;j++) {
            objc_property_t property = properties[j];
            if (property==NULL) {
                break;
            }
            const char *propType = getPropertyType(property);
            const char *propName = property_getName(property);
            NSString *name =[NSString stringWithCString:propName encoding:NSUTF8StringEncoding];
            NSString *type =[NSString stringWithCString:propType encoding:NSUTF8StringEncoding];
            if (type==nil) {
                type=[NSString stringWithCString:propType encoding:NSASCIIStringEncoding];
            }
            if(type==nil)
                type=name;
            if(propName) {
                id obj = [dict objectForKey:name];
                if (!obj)
                    continue;
                if ([type isEqualToString:@"i"] || [type isEqualToString:@"l"] || [type isEqualToString:@"s"]) {
                    [self setValue:[NSNumber numberWithInteger:[obj integerValue]] forKey:name];
                } else if ([type isEqualToString:@"I"] || [type isEqualToString:@"L"] || [type isEqualToString:@"S"]) {
                    [self setValue:[NSNumber numberWithLongLong:[obj longLongValue]] forKey:name];
                } else if ([type isEqualToString:@"f"] || [type isEqualToString:@"d"]) {
                    [self setValue:[NSNumber numberWithDouble:[obj doubleValue]] forKey:name];
                } else if ([type isEqualToString:@"NSString"]||[type hasPrefix:@"NSString"]) {
                    [self setValue:[NSString stringWithString:obj] forKey:name];
                } else if ([type isEqualToString:@"c"]) {
                    [self setValue:[NSNumber numberWithChar:[obj charValue]] forKey:name];
                } else if ([type isEqualToString:@"NSMutableArray"] || [type isEqualToString:@"NSArray"]){
                    NSMutableArray *array=[[NSMutableArray alloc] init];
                    if ([(NSMutableArray*)obj count]>0) {
                        for (id adic in obj) {
                            if ([adic  isKindOfClass:[NSString class]]) {
                                [array addObject:adic];
                            }else {
                                id item=[[NSClassFromString(name) alloc] initWithDict:adic className:name];
                                [array addObject:item];
                            }
                        }
                    }
                    [self setValue:array forKey:name];
                }else {
                    if ([obj isKindOfClass:[NSString class]]) {
                        [self setValue:[NSString stringWithString:obj] forKey:name];
                    }else{
                        id item=[[NSClassFromString(type) alloc] initWithDict:obj className:type];
                        [self setValue:item forKey:name];
                    }
                }
            }
        }
        free(properties);
    }
    return self;
}

static const char * getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
    
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            char *attributeTemp=(char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute)] bytes];
            char *p = strtok(attributeTemp, "\"");
            if(p)
            {
                return (const char*)p;
            }
            p = strtok(NULL, "\"");
            if(p)
                return  (const char*)p;
        }
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            char *attributeTemp=(char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute)] bytes];
            char *p = strtok(attributeTemp, "\"");
            if(p)
            {
                return (const char*)p;
            }
            p = strtok(NULL, "\"");
            if(p)
                return  (const char*)p;
        }
        return nil;
    }
    return nil;
}

- (NSDictionary*)getDictionaryData:(id)obj
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    objc_property_t *props = class_copyPropertyList([obj class], &propsCount);
    for(int i = 0;i < propsCount; i++)
    {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [obj valueForKey:propName];
        if(value == nil)
        {
            value = [NSNull null];
        }
        else
        {
            value = [self getObjectInternal:value];
        }
        [dic setObject:value forKey:propName];
    }
    return dic;
}

- (id)getObjectInternal:(id)obj
{
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]])
    {
        return obj;
    }
    
    if([obj isKindOfClass:[NSArray class]])
    {
        NSArray *objarr = obj;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:objarr.count];
        for(int i = 0;i < objarr.count; i++)
        {
            [arr setObject:[self getObjectInternal:[objarr objectAtIndex:i]] atIndexedSubscript:i];
        }
        return arr;
    }
    
    if([obj isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *objdic = obj;
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[objdic count]];
        for(NSString *key in objdic.allKeys)
        {
            [dic setObject:[self getObjectInternal:[objdic objectForKey:key]] forKey:key];
        }
        return dic;
    }
    return [self getDictionaryData:obj];
}
@end
