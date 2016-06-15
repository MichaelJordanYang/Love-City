//
//  JDYFountTitleView.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JDYFountTitleView;

@protocol JDYFountTitleViewDelegate <NSObject>

/* 点击了标题按钮时调用, 参数为传入的角标 */
- (void)foundTitleView:(JDYFountTitleView *)titleView didClickBtnIndex:(NSInteger)btnIndex;

@end

@interface JDYFountTitleView : UIView

@property (nonatomic, weak) id<JDYFountTitleViewDelegate> delegate;

/* 根据传入的的标题创建一个标题视图 */
- (instancetype)initWithLeftText:(NSString *)leftText rightText:(NSString *)rightText;

/* 底部线滚动到对应的位置 */
- (void)bottomLineScollIndex:(int)index;


@end
