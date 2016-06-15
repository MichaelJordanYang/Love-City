//
//  JDYEventCell.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/13.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDYBeautifulDayItem;
@interface JDYEventCell : UITableViewCell

+ (JDYEventCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) JDYBeautifulDayItem *beautlfulDayItem;

@end
