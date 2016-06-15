//
//  JDYFoundStoreViewController.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYFoundStoreViewController.h"
#import "JDYFountTitleView.h"
#import "JDYBeautifulDayItem.h"
#import "JDYThemesCell.h"
#import "JDYThemesItem.h"
#import "JDYEventCell.h"
#import "UIImage+Image.h"

#import "JDYTitleBtn.h"

#define JDYNavH 64
#define JDYTabBarH 49

@interface JDYFoundStoreViewController ()<JDYFountTitleViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
/* 底部滚动 */
@property (nonatomic, weak) UIScrollView *bottomScrollView;

/* 左边tableView */
@property (nonatomic, weak) UITableView *leftTableV;

/* 左边的数据 */
@property (nonatomic, strong) NSArray *leftData;


@property (nonatomic, strong)NSArray *themeData;

@end

@implementation JDYFoundStoreViewController


- (NSArray *)leftData {
    
    if (_leftData == nil) {
        _leftData =  [JDYBeautifulDayItem getMessage];
    }
    return _leftData;
}



- (NSArray *)themeData {
    
    if (_themeData == nil) {
        _themeData =  [JDYThemesItem getThemesData];
    }
    return _themeData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航条
    [self setNav];
    //设置ScrollView
    [self setScrollView];
    
    //在ScrollView中添加TableView
    [self setTableView];
    
    
    
}

/**
 *  设置导航条
 */
- (void)setNav {
    
    //设置背景
    [self. navigationController.navigationBar  setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
    
    //设置左侧内容
    JDYTitleBtn *btn = [JDYTitleBtn buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"未来研究所" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"home_down"] forState:UIControlStateNormal];
    //监听按钮点击
    [btn addTarget:self action:@selector(cityClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //设置右侧内容
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"附近" style:0 target:self action:@selector(nearClick)];
    
    //设置中间标题视图
    JDYFountTitleView *foundTitle = [[JDYFountTitleView alloc] initWithLeftText:@"美天" rightText:@"美辑"];
    foundTitle.delegate = self;
    foundTitle.frame = CGRectMake(0, 0, 120, 44);
    self.navigationItem.titleView = foundTitle;
}

/**
 *  设置ScrollView
 */
- (void)setScrollView {
    
    UIScrollView *bottomScollView = [[UIScrollView alloc] init];
    //设置scrollView属性.
    
    bottomScollView.frame = CGRectMake(0, 0, screenW, screenH - JDYNavH - JDYTabBarH);
    bottomScollView.backgroundColor = JDYColor(255, 255, 255, 1);
    bottomScollView.contentSize = CGSizeMake(screenW * 2.0, 0);
    bottomScollView.showsHorizontalScrollIndicator = NO;
    bottomScollView.showsVerticalScrollIndicator = NO;
    bottomScollView.pagingEnabled = YES;
    bottomScollView.delegate = self;
    [self.view addSubview:bottomScollView];
    self.bottomScrollView = bottomScollView;
    
    
    
    
}

/**
 *  在ScrollView中添加TableView
 */
- (void)setTableView {
    //美天
    UITableView *letfTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, self.bottomScrollView.height) style:UITableViewStyleGrouped];
    letfTableV.dataSource = self;
    letfTableV.delegate = self;
    letfTableV.backgroundColor = JDYColor(255, 255, 255, 1);
    letfTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    letfTableV.sectionFooterHeight = 5;
    letfTableV.sectionHeaderHeight = 5;
    
    letfTableV.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0);
    
    [self.bottomScrollView addSubview:letfTableV];
    self.leftTableV = letfTableV;
    
    //美辑
    UITableView *rightTableV = [[UITableView alloc] initWithFrame:CGRectMake(screenW, 0, screenW, self.bottomScrollView.height) style:UITableViewStylePlain];
    rightTableV.dataSource = self;
    rightTableV.delegate = self;
    rightTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.bottomScrollView addSubview:rightTableV];
    self.leftTableV = letfTableV;
    
}
//城市点击
- (void)cityClick:(UIButton *)btn {
    
}
//附近点击
- (void)nearClick {
    
}

/**
 *  点击标题按钮时调用
 *
 *  @param titleView 标题View
 *  @param btnIndex  当前点击按钮的角标
 */
- (void)foundTitleView:(JDYFountTitleView *)titleView didClickBtnIndex:(NSInteger)btnIndex {
    
    //跳转到指写的tableView
    [self.bottomScrollView setContentOffset:CGPointMake(screenW * btnIndex, 0) animated:YES];
}

/**
 *  当ScrollView停止滚动时, 让标题View底部线滚动
 *
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //计算当前是第几页
    if (scrollView == self.bottomScrollView) {
        int pageIndex = scrollView.contentOffset.x / screenW;
        
        JDYFountTitleView *titleView = (JDYFountTitleView *)self.navigationItem.titleView;
        [titleView bottomLineScollIndex:pageIndex];
    }
}

#pragma mark - 共有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (tableView == self.leftTableV) {
        return self.leftData.count;
    }else {
        return 1;
    }
}

#pragma mark - 每一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (tableView == self.leftTableV) {
        //取出当前所在的组模型
        JDYBeautifulDayItem *item = self.leftData[section];
        if (item.themes.count > 0) {
            return 2;
        }else {
            return 1;
        }
    }else {
        return self.themeData.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == self.leftTableV) {
        
        if (indexPath.row == 1) {
            
            //取出当前所在的组模型
            JDYBeautifulDayItem *item = self.leftData[indexPath.section];
            
            JDYThemesCell *cell = [JDYThemesCell cellWithTableView:tableView];
            cell.themesItem = item.themes[0];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            
        }else {
            //取出当前所在的组模型
            JDYBeautifulDayItem *item = self.leftData[indexPath.section];
            JDYEventCell *cell = [JDYEventCell cellWithTableView:tableView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.beautifulDayItem = item;
            cell.beautlfulDayItem = item;
            return cell;
        }
    
    }else {
        
        JDYThemesCell *cell = [JDYThemesCell cellWithTableView:tableView];
        JDYThemesItem *themeItem = self.themeData[indexPath.row];
        cell.themesItem = themeItem;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
}

//返回每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //如果是左边
    if (tableView == self.leftTableV) {
        //是第一行
        if( indexPath.row == 1) {
            return 220;
        } else {
            //第0行
            return 253;
        }
        
    } else {
        return 240;
    }
}
//点击执行Cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
@end
