//
//  DeviceViewController.m
//  advertise
//
//  Created by VKWK on 6/11/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "DeviceViewController.h"
#import "DeviceTableViewCell.h"
#import "CurrentStatusViewController.h"
#import "ConstantHeader.h"


//static NSString *reuseable=@"scanlist";
//static NSString *reuseable2=@"devicelist";
static NSString *reuseable3=@"menucell";

@interface DeviceViewController ()<GCDAsyncUdpSocketDelegate,UITableViewDataSource,UITextFieldDelegate,MAMapViewDelegate>
{
    
    NSArray *wheelList;
    BOOL scaning;
    NSMutableArray *discoverdlist;
    NSMutableArray *uuidList;
    NSMutableDictionary *rssiDic;
    GCDAsyncUdpSocket *listenSocket;
    
    NSString *str;
    UITextField *textfiled;
    double S1;
    double S2;
    MAPointAnnotation *point;
    NSString *s;
    NSArray *arr1;
    NSMutableArray *arr;
    NSString *local;
    NSString *other;

    NSMutableArray *Datalist;
    NSMutableArray *idList;

     int i;
    
}
@property(nonatomic,weak)IBOutlet UITableView *deviceList;

@end

@implementation DeviceViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    i=1;
    self.title=@"联系人";
    [self.deviceList registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseable3];
    Datalist=[NSMutableArray array];
    idList=[NSMutableArray array];
    [self editTextfiled];
    //    [self editTableView];
    //    [self createCell];
    
    
    // Do any additional setup after loading the view.
}



-(void)editTextfiled;
{
    textfiled=[[UITextField alloc]initWithFrame:CGRectMake(0, 75, self.view.frame.size.width, 30)];
    textfiled.backgroundColor=[UIColor whiteColor];
    textfiled.clearButtonMode = UITextFieldViewModeWhileEditing;
    textfiled.delegate=self;
    textfiled.returnKeyType=UIReturnKeyDone;
    [self.view addSubview:textfiled];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    str=textfiled.text;
    [textField resignFirstResponder];
    [self createUdpSocket];
    [self.deviceList reloadData];
    return YES;
}


#pragma mark - UdpSocket

-(void) createUdpSocket
{
    
    listenSocket = [[GCDAsyncUdpSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_main_queue() socketQueue:nil];
    
    NSError*err=nil;
    
    NSString * Datastr=@"REQUEST";
    NSData *data =[Datastr dataUsingEncoding:NSUTF8StringEncoding];
    
    
<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
    [listenSocket sendData:data toHost:@"100.64.132.196" port:40000 withTimeout:-1 tag:1];
    
    if ([listenSocket connectToHost:@"100.64.132.196" onPort:40000 error:&err])
=======
    [listenSocket sendData:data toHost:@"192.168.1.104" port:40000 withTimeout:-1 tag:1];
    
    if ([listenSocket connectToHost:@"192.168.1.104" onPort:40000 error:&err])
>>>>>>> try to push
    {
        NSLog(@"Connected!");
    }
    
    NSError *receverr;
    
    [listenSocket beginReceiving:&receverr];

}



-(void)udpSocket:(GCDAsyncUdpSocket *)sock didReceiveData:(NSData *)data fromAddress:(NSData *)address withFilterContext:(id)filterContex
{


    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    
    s = [[NSString alloc] initWithData:data encoding:gbkEncoding];
    
    
    if([s isEqualToString:@"RE-REQUEST"]){
        NSLog(@"!!!");
        return;
    }
    else{
    arr1=[[NSArray alloc]init];
    arr1 =[s componentsSeparatedByString:@" "];
    arr=[NSMutableArray arrayWithArray:arr1];

    NSLog(@"%@",arr);
        
<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
=======
    [[NSNotificationCenter defaultCenter]postNotificationName:Notification_allData object:arr];
        
>>>>>>> try to push
    if([[arr objectAtIndex:0] isEqualToString:@"V"])
    {
       S1=[[arr objectAtIndex:2] doubleValue];
       S2=[[arr objectAtIndex:4] doubleValue];
       local=[[NSString  alloc]init];
       local=@"local car";
       [[NSNotificationCenter defaultCenter]postNotificationName:Notification_AddStr object:local userInfo:nil];
       [self addAnnotation];
    }
    
    else if ([[arr objectAtIndex:2]isEqualToString:@"V"])
    {
        S1=[[arr objectAtIndex:4] doubleValue];
        S2=[[arr objectAtIndex:6] doubleValue];
        other=[arr objectAtIndex:0];
        
        [self addAnnotation];
    }
    else if ([[arr objectAtIndex:2]isEqualToString:@"A"])
    {
        [idList addObject:[arr objectAtIndex:0]];
        [Datalist addObject:[arr objectAtIndex:3]];
        [self.deviceList scrollRectToVisible:CGRectMake(0, self.deviceList.frame.size.height, self.deviceList.frame.size.width, 0) animated:YES];
        [self.deviceList reloadData];
<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
        []
=======
        [[NSNotificationCenter defaultCenter]postNotificationName:Notification_AddID object:idList];
>>>>>>> try to push
    }
    }
}





#pragma mark - addPointAnnotation

-(void)addAnnotation
{
    point = [[MAPointAnnotation alloc] init];
    point.coordinate = CLLocationCoordinate2DMake(S1, S2);
    if ([local isEqualToString:@"local car"]) {
        point.title=@"local car";
    }else{
    point.title=other;
    }
    [[NSNotificationCenter defaultCenter]postNotificationName:Notification_AddPoints object:point userInfo:nil];
<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:Notification_AddStr object:local userInfo:nil];
=======
>>>>>>> try to push
}


#pragma mark - TableView

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Datalist.count;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseable3 forIndexPath:indexPath];
    cell.textLabel.text=Datalist[indexPath.row];
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
