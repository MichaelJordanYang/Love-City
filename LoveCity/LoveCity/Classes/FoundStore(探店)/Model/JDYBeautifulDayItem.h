//
//  JDYBeautifulDayItem.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDYBeautifulDayItem : NSObject
//组标题
@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSArray *events;

@property (nonatomic, strong) NSArray *themes;

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;


+ (NSArray *)getMessage;

@end
