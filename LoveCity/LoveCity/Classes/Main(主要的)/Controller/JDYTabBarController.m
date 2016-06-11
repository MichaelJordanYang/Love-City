//
//  JDYTabBarController.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "JDYTabBarController.h"
#import "JDYFoundStoreViewController.h"
#import "JDYExperienceViewController.h"
#import "JDYClassifyViewController.h"
#import "JDYMeViewController.h"
#import "JDYNavigationController.h"

@interface JDYTabBarController ()


@end

@implementation JDYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.translucent = YES;
    self.tabBar.backgroundImage = [UIImage imageNamed:@"bar"];
    self.tabBar.tintColor = [UIColor blackColor];
    //添加所有子控制器
    [self addAllChildVc];
}

#pragma mark --------------------
#pragma mark 添加所有子控制器
- (void)addAllChildVc
{
    //探店
    JDYFoundStoreViewController *foundStoreVc = [[JDYFoundStoreViewController alloc] init];
    [self addOneChildVc:foundStoreVc image:[UIImage imageNamed:@"recommendation_1"] selectedImage:[UIImage imageNamed:@"recommendation_2"] title:@"探店"];
    
     //体验
     JDYExperienceViewController *experienceVc = [[JDYExperienceViewController alloc] init];
     [self addOneChildVc:experienceVc image:[UIImage imageNamed:@"broadwood_1"] selectedImage:[UIImage imageNamed:@"broadwood_2"] title:@"体验"];
    
    //分类
    JDYClassifyViewController *classifyVc = [[JDYClassifyViewController alloc] init];
    [self addOneChildVc:classifyVc image:[UIImage imageNamed:@"classification_1"] selectedImage:[UIImage imageNamed:@"classification_2"] title:@"分类"];
    
    //我
     JDYMeViewController *meVc = [[JDYMeViewController alloc] init];
    [self addOneChildVc:meVc image:[UIImage imageNamed:@"my_1"] selectedImage:[UIImage imageNamed:@"my_2"] title:@"我"];
}

#pragma mark --------------------
#pragma mark 添加一个子控制器
/* 添加一个子控制器 */
- (void)addOneChildVc:(UIViewController *)vc image:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    //设置导航条的子控制器
    JDYNavigationController *nav = [[JDYNavigationController alloc] initWithRootViewController:vc];
    
    //设置tabBar内容
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selectedImage;
    
    //添加子控制器到tabBarVc中
    [self addChildViewController:nav];
    
}

@end
