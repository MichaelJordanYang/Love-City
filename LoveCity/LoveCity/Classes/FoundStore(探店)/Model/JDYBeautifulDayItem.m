//
//  JDYBeautifulDayItem.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYBeautifulDayItem.h"
#import "JDYEventsItem.h"
#import "JDYThemesItem.h"

@implementation JDYBeautifulDayItem

+ (NSArray *)getMessage
{

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"BeautifulDay.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary  *dict in array) {
        JDYBeautifulDayItem *item = [[JDYBeautifulDayItem alloc] init];
        [item setValuesForKeysWithDictionary:dict];
        [tempArray addObject:item];
    }
    return tempArray;
    
}

- (void)setValue:(id)value forKey:(NSString *)key {
    // 拦截body
    if ([key isEqualToString:@"themes"]) {
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in (NSArray *)value) {
            JDYThemesItem *model = [JDYThemesItem themsItemWithDict:dict];
            [arrM addObject:model];
        }
        self.themes = [arrM copy];
        return;
    }else if([key isEqualToString:@"events"]) {
        
        NSMutableArray *arrM = [NSMutableArray array];
        
        for (NSDictionary *dict in (NSArray *)value) {
            JDYEventsItem *model = [JDYEventsItem eventsItemWithDict:dict];
            [arrM addObject:model];
        }
        self.events = [arrM copy];
        return;
    }
    [super setValue:value forKey:key];
}



- (void)setDate:(NSString *)date {
    _date = date;
    
    if (date.length == 10) {
        
        NSString *tmpM = [date substringWithRange:NSMakeRange(5, 2)];
        
        NSInteger res = tmpM.intValue;
        
        switch (res) {
            case 1:
                self.month = @"Jan.";
                break;
            case 2:
                self.month = @"Feb.";
                break;
            case 3:
                self.month = @"Mar.";
                break;
            case 4:
                self.month = @"Apr.";
                break;
            case 5:
                self.month = @"May.";
                break;
            case 6:
                self.month = @"Jun.";
                break;
            case 7:
                self.month = @"Jul.";
                break;
            case 8:
                self.month = @"Aug.";
                break;
            case 9:
                self.month = @"Sep.";
                break;
            case 10:
                self.month = @"Oct.";
                break;
            case 11:
                self.month = @"Nov.";
                break;
            case 12:
                self.month = @"Dec.";
                break;
                
            default:
                self.month = @"\(tmpM).";
        }
    } else {
        self.month = @"Aug.";
    }
    
    self.day = [date substringWithRange:NSMakeRange(8, 2)];
    
    
    
}


@end
