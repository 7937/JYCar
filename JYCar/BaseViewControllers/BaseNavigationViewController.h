//
//  BaseNavigationViewController.h
//  JYCar
//
//  Created by wavesknn on 15/9/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavigationViewController : UINavigationController
/**
 *修改NavigationBar的颜色
 */
-(void)setBarColor:(UIColor *)color;

/**
 *修改NavigationBar的title的字体颜色
 */
-(void)setTitleColor:(UIColor *)color;

/**
 *修改NavigationBar的item的填充颜色
 */
-(void)setTintColor:(UIColor *)color;

/**
 *返回按钮祛除文字
 */
-(void)BackButtonWithoutWord:(BOOL)without;

@end
