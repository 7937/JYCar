//
//  ChatViewData.m
//  JYCar
//
//  Created by waveknns on 15/10/15.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "ChatViewData.h"

#import "NSUserDefaults+DemoSettings.h"
#import "ConstantHeader.h"

@implementation ChatViewData
{
    NSMutableArray * allData;
}


-(instancetype)init
{
    self=[super init];
    if (self) {
        if ([NSUserDefaults emptyMessagesSetting]) {
            self.messages = [NSMutableArray new];
        }
    allData = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(addAllData:) name:Notification_allData object:nil];
        
    JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc]init];
    self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
    self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    }
    return self;
}

-(void)addAllData:(NSNotification *)givenData
{
    NSLog(@"givendata is    %@",givenData);
    
    allData = givenData.object;
    
    if ([[allData objectAtIndex:2]isEqualToString:@"A"]){
        [self loadTextMessages];
    }

    NSLog(@"allData is    %@",allData);
}

- (void)loadTextMessages
{
    [self.messages addObject:[[JSQMessage alloc] initWithSenderId:[allData objectAtIndex:0] senderDisplayName:[allData objectAtIndex:0] date:[NSDate date] text:[allData objectAtIndex:3]]];
}

-(void)addPhotoMediaMessage
{

}
- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion
{
    
}

-(void)addVideoMediaMessage
{

}

@end
