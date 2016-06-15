//
//  JDYEventsItem.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYEventsItem.h"

@implementation JDYEventsItem

+ (instancetype)eventsItemWithDict:(NSDictionary *)dict
{
    JDYEventsItem *item = [[JDYEventsItem alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    
    return item;
}

@end
