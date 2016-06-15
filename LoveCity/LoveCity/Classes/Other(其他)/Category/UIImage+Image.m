//
//  UIImage+Image.m
//  LoveCity
//
//  Created by xiaoyang on 16/6/11.
//  Copyright © 2016年 yangChunFu. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    //描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    //开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    
    //获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    //渲染上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    //从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //结束上下文
    UIGraphicsEndImageContext();
    
    
    return theImage;
}
@end
