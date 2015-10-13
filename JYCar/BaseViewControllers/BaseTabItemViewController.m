//
//  BaseTabItemViewController.m
//  UniversalFramewrok_1
//
//  Created by viking warlock on 6/3/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "BaseTabItemViewController.h"

@interface BaseTabItemViewController ()

@end

@implementation BaseTabItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title=self.title;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated
{
    if (self.rightItem) {
        [self.tabBarController.navigationItem setRightBarButtonItems:self.rightItem];
    }else
    {
        [self.tabBarController.navigationItem setRightBarButtonItems:nil];
    }
    
    if (self.leftItem) {
        [self.tabBarController.navigationItem setLeftBarButtonItems:self.leftItem];
    }else
    {
        [self.tabBarController.navigationItem setLeftBarButtonItems:nil];
    }
    self.tabBarController.navigationItem.title=self.title;
    
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
