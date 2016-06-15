//
//  JDYTitleBtn.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/14.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDYTitleBtn : UIButton

/* 取消按钮的高亮 */
- (void)setHighlighted:(BOOL)highlighted;

/* 文字大小自适应 */
- (void)setTitle:(NSString *)title forState:(UIControlState)state;

/* 图片状态自适应 */
- (void)setImage:(UIImage *)image forState:(UIControlState)state;

/* 调整按钮内容文字图片 */
- (void)layoutSubviews;



@end
