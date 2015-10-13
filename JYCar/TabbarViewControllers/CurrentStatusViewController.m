//
//  FirstViewController.m
//  JYCar
//
//  Created by wavesknn on 15/9/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CurrentStatusViewController.h"
#import "DashBoardView.h"
#import "DeviceViewController.h"
#define APIkey @"d2bc8430bbed95a99b0d152566320ba2"
#import "ConstantHeader.h"

@interface CurrentStatusViewController()<MAMapViewDelegate>
{
    UIButton *_locationButton;
    DashBoardView *dashboard;
    MAMapView * _mapView;
    MAPointAnnotation *point;
    NSMutableArray *pointArray;
    NSString *localStr;
}

@end

@implementation CurrentStatusViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"实况";
    [self initMapView];
//    [self locationAction];
    dashboard=[[DashBoardView alloc]initWithFrame:CGRectMake(5.f,64.f+ 10.f, self.view.frame.size.width-10.f, 60.f)];
    pointArray=[NSMutableArray array];
    [self.view addSubview:dashboard];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addpoint:) name:Notification_AddPoints object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addStr:) name:Notification_AddStr object:nil];
    
    
}

//修改定位模式
-(void)locationAction{
    if (_mapView.userTrackingMode != MAUserTrackingModeFollow) {
        [_mapView setUserTrackingMode:MAUserTrackingModeFollow];
    }
}

-(void)initMapView{
    
    [MAMapServices sharedServices].apiKey=APIkey;
    
    _mapView=[[MAMapView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _mapView.compassOrigin=CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin=CGPointMake(_mapView.scaleOrigin.x, 22);
    _mapView.delegate=self;
    
    [self.view addSubview:_mapView];
    
//    _mapView.showsUserLocation=YES;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)addpoint:(NSNotification *)notify
{
    MAPointAnnotation *points=notify.object;

    [_mapView setCenterCoordinate:points.coordinate];
    [_mapView addAnnotation:points];
}

-(void)addStr:(NSNotification *)localstr
{
    localStr=localstr.object;
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        
        if ([localStr isEqualToString:@"local car"])
        {
            annotationView.pinColor=MAPinAnnotationColorGreen;
        }
        localStr=nil;
        return annotationView;
    }
    return nil;
    
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
