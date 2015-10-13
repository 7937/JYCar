//
//  ViewController.m
//  JYCar
//
//  Created by wavesknn on 15/8/31.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import "BaseNavigationViewController.h"

@interface ViewController ()


@end

@implementation ViewController

////开启定位
- (void)viewDidLoad {
    [super viewDidLoad];
    //    _mapView.showsUserLocation=YES;
    //    NSLog(@"ggg");
    //    ;    // Do any additional setup after loading the view, typically from a nib.
    
    [self performSelector:@selector(disappear) withObject:nil afterDelay:1.f];
}

- (void)disappear
{
    BaseNavigationViewController *navi=[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"BaseNavi"];
    UIWindow*window=[UIApplication sharedApplication].windows.firstObject;
    window.rootViewController=navi;
}


//
////显示地图 定位图层
//-(void)viewDidAppear:(BOOL)animated
//{

//    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//    pointAnnotation.coordinate = CLLocationCoordinate2DMake(_location.coordinate.latitude, _location.coordinate.longitude);
//    pointAnnotation.title = @"方恒国际";
//    pointAnnotation.subtitle = @"阜通东大街6号";
//    
//    [_mapView addAnnotation:pointAnnotation];
//
//
////    [self mapView:_mapView didUpdateUserLocation:_location updatingLocation:YES];
//    
//}
//
//
//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
//        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
//        }
//        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
//        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
//        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
//        annotationView.pinColor = MAPinAnnotationColorPurple;
//        [self.view addSubview:_mapView];
//        return annotationView;
//
//
//    }
//    return nil;
//}
//- (void)mapView:(MAMapView *)mapView didAddAnnotationViews:(NSArray *)views
//{
//    MAAnnotationView *view = views[0];
//    
//    // 放到该方法中用以保证userlocation的annotationView已经添加到地图上了。
//    if ([view.annotation isKindOfClass:[MAUserLocation class]])
//    {
//        MAUserLocationRepresentation *pre = [[MAUserLocationRepresentation alloc] init];
//        pre.fillColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.3];
//        pre.strokeColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:1.0];
//        pre.image = [UIImage imageNamed:@"location.png"];
//        pre.lineWidth = 3;
//        pre.lineDashPattern = @[@6, @3];
//        
//        [mapView updateUserLocationRepresentation:pre];
//        
//        view.calloutOffset = CGPointMake(0, 0);
//        NSLog(@"bggg");
//    }
//}
//


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
