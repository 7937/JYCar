//
//  MyselfViewController.m
//  advertise
//
//  Created by VKWK on 6/11/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "MyselfViewController.h"

static NSString *reuseable=@"menuCell";

@interface MyselfViewController ()<UITableViewDataSource,UITableViewDelegate>
{

}
@property(nonatomic,weak)IBOutlet UITableView *menuList;

@end

@implementation MyselfViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"设置";
    [self.menuList registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseable];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 2;
        default:
            return 2;
            break;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseable forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
        {
            cell.textLabel.text=@"我";
            break;
        }
        case 1:{
            if (indexPath.row==0) {
                cell.textLabel.text=@"我的车";
            }else
                cell.textLabel.text=@"我的里程";
            break;
        }
        default:
        {
            if (indexPath.row==0) {
                cell.textLabel.text=@"检查版本";
            }else
                cell.textLabel.text=@"关于";
            break;
        }
    }
    return cell;
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
