//
//  ZenEmptyObjectFilter.h
//  Use for filter the null and empty NSString(@"") in NSDictionary and NSArray.
//  用于过滤掉字符串、数组、字典里面的空对象(null)或者空字符串(@"")
//  Created by zhenby on 13-3-7.
//  Copyright (c) 2013年 zhenby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZenEmptyObjectFilter : NSObject

+ (id)emptyObjectFilter:(id)object;
+ (void)setObject:(id)anObject forKey:(NSString *)aKey toDictionary:(NSMutableDictionary **)dict;
+ (void)addObject:(id)anObject toArray:(NSMutableArray **)array;

@end
