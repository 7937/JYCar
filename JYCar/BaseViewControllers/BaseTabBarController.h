//
//  BaseTabBarController.h
//  JYCar
//
//  Created by wavesknn on 15/9/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabBarController : UITabBarController
/**
 *设置Tabbar 的背景颜色
 */
-(void)setTabbarTintColor:(UIColor*)color;

/**
 *设置Tabbar item 的填充颜色
 */
-(void)setBarItemColor:(UIColor*)color;

/**
 *设置某一个item的badge
 */
-(void)setBadge:(NSString*)badge ForBarItemIndex:(NSInteger)index;

@end
