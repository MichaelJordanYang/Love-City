//
//  LoveCity.h
//  LoveCity
//
//  Created by xiaoyang on 16/6/12.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#ifdef __OBJC__

//屏幕宽高
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

//根据RGB生成颜色
#define JDYColor(r,g,b,a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]


//自定义Log
#ifdef DEBUG

#define JDYLOG(...) NSLog(__VA_ARGS__)

#else

#define JDYLOG(...)

#endif

//共有头文件
#import "UIView+Frame.h"


#endif
