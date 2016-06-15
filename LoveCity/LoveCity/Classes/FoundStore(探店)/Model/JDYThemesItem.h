//
//  JDYThemesItem.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDYThemesItem : NSObject

@property (nonatomic, strong) NSString *begin_time;
@property (nonatomic, assign) NSInteger hasweb;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *themeurl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger ID;

+ (instancetype)themsItemWithDict:(NSDictionary *)dict;

+ (NSArray *)getThemesData;

@end
