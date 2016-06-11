//
//  AppDelegate.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "AppDelegate.h"
#import "JDYTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[JDYTabBarController alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
