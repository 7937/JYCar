//
//  BaseNavigationViewController.m
//  JYCar
//
//  Created by wavesknn on 15/9/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BaseNavigationViewController.h"

@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBarColor:[UIColor blackColor]];
    [self setTitleColor:[UIColor whiteColor]];

    // Do any additional setup after loading the view.
}
-(void)setBarColor:(UIColor *)color
{
    if (self.navigationBarHidden) {
        return;
    }
    [self.navigationBar setBarTintColor:color];
}
-(void)setTitleColor:(UIColor *)color
{
    if (self.navigationBarHidden) {
        return;
    }
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:color}];
}

-(void)setTintColor:(UIColor *)color
{
    if (self.navigationBarHidden) {
        return;
    }
    [self.navigationBar setTintColor:color];
}

-(void)BackButtonWithoutWord:(BOOL)without
{
    if (without) {
        UIBarButtonItem *backButton=[[UIBarButtonItem alloc]init];
        backButton.title=@"";
        self.navigationItem.backBarButtonItem=backButton;
    }
    else
    {
        self.navigationItem.backBarButtonItem=nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
