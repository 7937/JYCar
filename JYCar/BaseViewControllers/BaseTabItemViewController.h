//
//  BaseTabItemViewController.h
//  UniversalFramewrok_1
//
//  Created by viking warlock on 6/3/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

/**
 *加载在TabbarController中作为TabItem的ViewController
 */

#import "BaseViewController.h"

@interface BaseTabItemViewController : BaseViewController

@property(nonatomic,copy)NSArray *rightItem;
@property(nonatomic,copy)NSArray *leftItem;

@end

