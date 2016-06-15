//
//  JDYFountTitleView.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYFountTitleView.h"

@interface JDYFountTitleView ()

/* 左侧的按钮 */
@property (nonatomic, weak) UIButton *leftBtn;

/* 右侧的按钮 */
@property (nonatomic, weak) UIButton *rightBtn;

/* 底部层的线 */
@property (nonatomic, weak) UIView *bottomLine;

/* 当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedBtn;


@end

@implementation JDYFountTitleView

- (instancetype)initWithLeftText:(NSString *)leftText rightText:(NSString *)rightText {
    
    if (self = [super init]) {
        
        //添加左右侧按钮
        [self setBtnWithTitle:leftText rightText:rightText];
        
        //添加底部的线
        [self setBottomLine];
    }
    return self;
    
}

//设置按钮
- (void)setBtnWithTitle:(NSString*)leftTitle rightText:(NSString *)rightText {
    //左侧按钮
    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbtn setTitle:leftTitle forState:UIControlStateNormal];
    leftbtn.tag = 0;
    //设置选中时的颜色
    [leftbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [leftbtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [leftbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self btnClick:leftbtn];
    [self addSubview:leftbtn];
    //监听按钮点击
    self.leftBtn = leftbtn;
    //右侧按钮
    UIButton *rightbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightbtn setTitle:rightText forState:UIControlStateNormal];
    rightbtn.tag = 1;
    //设置选中时的颜色
    [rightbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [rightbtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [self addSubview:rightbtn];
    [rightbtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightbtn;
}

//添加底部的线
- (void)setBottomLine {
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = JDYColor(60, 60, 60, 1);
    [self addSubview:bottomLine];
    self.bottomLine = bottomLine;
}

//按钮点击
- (void)btnClick:(UIButton *)btn {
    
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomLine.x = btn.x;
    }];
    //调用代理
    if ([self.delegate respondsToSelector:@selector(foundTitleView:didClickBtnIndex:)]) {
        [self.delegate foundTitleView:self didClickBtnIndex:btn.tag];
    }
}

//底部线滚动到对应的位置
- (void)bottomLineScollIndex:(int)index {
    
    if (index == 0) {
        [UIView animateWithDuration:0.25 animations:^{
            self.bottomLine.x = 0;
        }];
    }else {
        [UIView animateWithDuration:0.25 animations:^{
            self.bottomLine.x = self.leftBtn.width;
        }];
    }
}




//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //按钮的宽度为当前View的一半
    CGFloat btnW = self.width * 0.5;
    self.leftBtn.frame = CGRectMake(0, 0, btnW, self.height);
    self.rightBtn.frame = CGRectMake(btnW, 0, btnW, self.height);
    self.bottomLine.frame = CGRectMake(0, self.height - 2, btnW, 2);
}


@end
