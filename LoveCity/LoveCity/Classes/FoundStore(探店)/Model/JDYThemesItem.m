
//
//  JDYThemesItem.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYThemesItem.h"

@implementation JDYThemesItem

+ (instancetype)themsItemWithDict:(NSDictionary *)dict
{
    JDYThemesItem *item = [[JDYThemesItem alloc] init];
    
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}


- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        self.ID = (NSInteger)value;
        return;
    }
    [super setValue:value forKey:key];
}


+ (NSArray *)getThemesData
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"theme.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        JDYThemesItem *item = [[self alloc] init];
        [item setValuesForKeysWithDictionary:dict];
        [tempArray addObject:item];
    }
    
    return tempArray;
}

@end
