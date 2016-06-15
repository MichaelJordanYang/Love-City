//
//  JDYTitleBtn.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/14.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYTitleBtn.h"

@implementation JDYTitleBtn



/* 取消按钮的高亮 */
- (void)setHighlighted:(BOOL)highlighted
{
    
}

/* 文字大小自适应 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    [self sizeToFit];
}

/* 图片状态自适应 */
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    [self sizeToFit];
}

/* 调整按钮内容文字图片 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    
    self.imageView.x = self.titleLabel.width;
}



@end
