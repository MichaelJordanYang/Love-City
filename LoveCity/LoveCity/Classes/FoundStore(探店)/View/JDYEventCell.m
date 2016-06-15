//
//  JDYEventCell.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/13.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYEventCell.h"
#import "JDYBeautifulDayItem.h"
#import "JDYEventsItem.h"
#import "UIImageView+WebCache.h"

@interface JDYEventCell ()
@property (weak, nonatomic) IBOutlet UILabel *month;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *MainTitle;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UIImageView *backImageV;

@end

@implementation JDYEventCell

+ (JDYEventCell *)cellWithTableView:(UITableView *)tableView {
    
    
    static NSString *ID = @"EventCell";
    JDYEventCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"JDYEventCell" owner:nil options:nil][0];
    }
    
    return cell;
}

//赋值数据
- (void)setBeautlfulDayItem:(JDYBeautifulDayItem *)beautlfulDayItem
{
    _beautlfulDayItem = beautlfulDayItem;
    
    
    self.dayLabel.text = beautlfulDayItem.day;
    self.month.text = beautlfulDayItem.month;
    JDYEventsItem *events = beautlfulDayItem.events.lastObject;
    
    self.titleLabel.text = events.feeltitle;
    self.MainTitle.text = events.title;
    self.subTitle.text = events.address;
    
    NSURL *url = [NSURL URLWithString:events.imgs.lastObject];
    [self.backImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    

}
@end
