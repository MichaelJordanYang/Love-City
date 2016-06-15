//
//  JDYThemesCell.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/13.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDYThemesItem;

@interface JDYThemesCell : UITableViewCell

+ (JDYThemesCell *)cellWithTableView:(UITableView *)tableView;

/* 保存themesItem主题模型数据 */
@property (nonatomic,strong) JDYThemesItem *themesItem;

@end
