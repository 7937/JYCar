//
//  FlatSwitch.m
//  UniversalFramewrok_1
//
//  Created by VKWK on 6/6/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "FlatSwitch.h"

@interface FlatSwitch()
{
    UITapGestureRecognizer *backgroundTap;
    UIPanGestureRecognizer *panGesture;
    UIView *CoverView;
    CGPoint startPoint;
}
@end

@implementation FlatSwitch

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [self setlayouts];
    }
    return self;
}



-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setlayouts];
}


-(void)setlayouts
{
    self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    self.layer.borderWidth=0.5f;
    if (!CoverView) {
        CoverView=[[UIView alloc]init];
        [self addSubview:CoverView];
    }
    CoverView.frame=CGRectMake(self.frame.size.width/2.f, 0.5f, self.frame.size.width/2.f-0.5f, self.frame.size.height-1.f);

    backgroundTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressSelf)];
    [self addGestureRecognizer:backgroundTap];
    
    panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
    [CoverView addGestureRecognizer:panGesture];
    CoverView.backgroundColor=[UIColor whiteColor];
    
    self.on=NO;
    self.backgroundColor=[UIColor grayColor];
    
}



-(void)setOn:(BOOL)on
{
    BOOL havechange = (_on != on);
    _on=on;
    if (havechange) {
            [UIView animateWithDuration:0.1f delay:0.f options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.userInteractionEnabled=NO;
                if (on) {
                    self.backgroundColor=self.tintColor;
                    CoverView.frame=CGRectMake(0.25f, 0.5f, self.frame.size.width/2.f-0.5f, self.frame.size.height-1.f);
                }
                else
                {
                    self.backgroundColor=[UIColor grayColor];
                    CoverView.frame=CGRectMake(self.frame.size.width/2.f, 0.5f, self.frame.size.width/2.f-0.5f, self.frame.size.height-1.f);
                }
            } completion:^(BOOL finished) {
                self.userInteractionEnabled=YES;
            }];
    }
    if (havechange) {
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}


-(void)pressSelf
{
    self.on=!_on;
}

-(void)handleGesture:(UIPanGestureRecognizer*)sender
{
    CGFloat translationX = [sender translationInView:self].x;
    switch(sender.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            startPoint = CoverView.frame.origin;
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            if(_on && translationX < 0.0f)
            {
                CoverView.frame = CGRectMake(translationX, 0,
                                         CoverView.frame.size.width, CoverView.frame.size.height);
            }
            else if(!_on && translationX > 0.0f)
            {
                CoverView.frame = CGRectMake(startPoint.x + translationX, 0,CoverView.frame.size.width, CoverView.frame.size.height);
            }
        }
            break;
            
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            if((_on && translationX < 0.0f && ABS(translationX) > self.frame.size.width/4) ||
               (!_on && translationX > 0.0f && ABS(translationX) > self.frame.size.width/4))
                self.on = !_on;
            else
                self.on = _on;
        }
            break;
            
        default:
            break;
    }
}

-(void)showOn:(BOOL)show
{
    
    
}

-(void)setTintColor:(UIColor *)tintColor
{
    _tintColor=tintColor;
    [self setNeedsDisplay];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
