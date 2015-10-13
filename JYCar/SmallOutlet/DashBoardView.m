//
//  DashBoardView.m
//  UniversalFramewrok_1
//
//  Created by VKWK on 6/15/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "DashBoardView.h"

@interface DashBoardView()
{
    UILabel* speedLabel;
    UILabel* timerLabel;
    UILabel* distanceLabel;
    UILabel* speedView;
    UILabel* timerView;
    UILabel* distanceView;

}
@end


@implementation DashBoardView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithWhite:1.f alpha:0.9f];
        speedLabel=[[UILabel alloc]initWithFrame:CGRectMake(5.f, 5.f, frame.size.width/3.f-10.f, 20.f)];
        timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(5.f+frame.size.width/3.f, 5.f, frame.size.width/3.f-10.f, 20.f)];
        distanceLabel=[[UILabel alloc]initWithFrame:CGRectMake(5.f+frame.size.width/3.f*2.f, 5.f, frame.size.width/3.f-10.f, 20.f)];
        
        [self addSubview:speedLabel];
        [self addSubview:timerLabel];
        [self addSubview:distanceLabel];
        
        speedLabel.adjustsFontSizeToFitWidth=YES;
        timerLabel.adjustsFontSizeToFitWidth=YES;
        distanceLabel.adjustsFontSizeToFitWidth=YES;
        
        speedLabel.textAlignment=NSTextAlignmentCenter;
        timerLabel.textAlignment=NSTextAlignmentCenter;
        distanceLabel.textAlignment=NSTextAlignmentCenter;
        
        speedLabel.text=@"速度(KM/h)";
        timerLabel.text=@"时长";
        distanceLabel.text=@"路程(KM)";

        speedLabel.textColor=[UIColor blackColor];
        timerLabel.textColor=[UIColor blackColor];
        distanceLabel.textColor=[UIColor blackColor];
        
        speedView=[[UILabel alloc]initWithFrame:CGRectMake(speedLabel.frame.origin.x, 25.f, speedLabel.frame.size.width, frame.size.height-25.f)];
        timerView=[[UILabel alloc]initWithFrame:CGRectMake(timerLabel.frame.origin.x, 25.f, timerLabel.frame.size.width, frame.size.height-25.f)];
        distanceView=[[UILabel alloc]initWithFrame:CGRectMake(distanceLabel.frame.origin.x, 25.f, distanceLabel.frame.size.width, frame.size.height-25.f)];
        
        [self addSubview:speedView];
        [self addSubview:timerView];
        [self addSubview:distanceView];
        
        speedView.font=[UIFont fontWithName:@"DBLCDTempBlack" size:20.f];
        timerView.font=[UIFont fontWithName:@"DBLCDTempBlack" size:20.f];
        distanceView.font=[UIFont fontWithName:@"DBLCDTempBlack" size:20.f];
        
        speedView.textAlignment=NSTextAlignmentCenter;
        timerView.textAlignment=NSTextAlignmentCenter;
        distanceView.textAlignment=NSTextAlignmentCenter;
        
        speedView.textColor=[UIColor blackColor];
        timerView.textColor=[UIColor blackColor];
        distanceView.textColor=[UIColor blackColor];
        
        speedView.adjustsFontSizeToFitWidth=YES;
        timerView.adjustsFontSizeToFitWidth=YES;
        distanceView.adjustsFontSizeToFitWidth=YES;
        
        speedView.minimumScaleFactor=5.f;
        timerView.minimumScaleFactor=5.f;
        distanceView.minimumScaleFactor=5.f;
        
        speedView.text=@"0.0";
        timerView.text=@"00:00:00";
        distanceView.text=@"0.0";
        [self setNeedsDisplay];
    }
    return self;
}

-(void)setSpeed:(double)speed
{
    speedView.text=[NSString stringWithFormat:@"%.1lf",speed];
}

-(void)setTime:(NSString *)time
{
    timerView.text=time;
}

-(void)setDistance:(float)distance
{
    distanceView.text=[NSString stringWithFormat:@"%.1f",distance];
}

-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor lightGrayColor].CGColor);
    
    CGContextMoveToPoint(ctx, rect.size.width/3.f, 5.f);
    CGContextAddLineToPoint(ctx, rect.size.width/3.f, rect.size.height-10.f);
    
    CGContextMoveToPoint(ctx, rect.size.width/3.f*2, 5.f);
    CGContextAddLineToPoint(ctx, rect.size.width/3.f*2, rect.size.height-10.f);

    CGContextDrawPath(ctx, kCGPathStroke);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
