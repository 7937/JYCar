//
//  BaseTabBarController.m
//  JYCar
//
//  Created by wavesknn on 15/9/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseTabBarController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBarItemColor:[UIColor colorWithRed:114.f/255.f green:236.f/255.f blue:97.f/255.f alpha:1.f]];
    [self setTabbarTintColor:[UIColor blackColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTabbarTintColor:(UIColor*)color
{
    [self.tabBar setBarTintColor:color];
}

-(void)setBarItemColor:(UIColor*)color
{
    [self.tabBar setTintColor:color];
}

-(void)setBadge:(NSString*)badge ForBarItemIndex:(NSInteger)index
{
    if (self.viewControllers.count<=index) {
        return;
    }else
    {
        UITabBarItem *item=self.tabBar.items[index];
        item.badgeValue=badge;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
