//
//  TableViewController.h
//  JYCar
//
//  Created by waveknns on 15/10/13.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ChatViewController.h"

@interface TableViewController : UITableViewController<JSQChatViewControllerDelegate>

- (IBAction)unwindSegue:(UIStoryboardSegue *)sender;

@end
