

//
//  JDYThemesCell.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/13.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYThemesCell.h"
#import "JDYThemesItem.h"
#import "UIImageView+WebCache.h"

@interface JDYThemesCell ()

@property (weak, nonatomic) IBOutlet UIImageView *backImageV;
//做毛玻璃,还没有实现
@property (weak, nonatomic) IBOutlet UIImageView *moreshadows;
//标题
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//子标题
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@end

@implementation JDYThemesCell

/* 设置cell显示的内容 */
+ (JDYThemesCell *)cellWithTableView:(UITableView *)tableView
{
    //创建cell,到缓存池中取cell
    static NSString *ID = @"ThemesCell";
    
    JDYThemesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {//如果缓存池中没有
        
        //去加载自己对应xib中的cell
        cell = [[NSBundle mainBundle] loadNibNamed:@"JDYThemesCell" owner:nil options:nil][0];

    }
    return cell;
}

/* 设置模型数据 */
- (void)setThemesItem:(JDYThemesItem *)themesItem
{
    _themesItem = themesItem;
    
    NSURL *url = [NSURL URLWithString:themesItem.img];
    [self.backImageV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"quesheng"]];
    self.titleLabel.text = themesItem.title;
    self.subLabel.text = themesItem.keywords;}

@end
