//
//  ChatViewData.h
//  JYCar
//
//  Created by waveknns on 15/10/15.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

#import "JSQMessages.h"

static NSString * const AvatarDisplayName = @"My Car";

static NSString * const AvatarId = @"053496-4509-289";

@interface ChatViewData : NSObject

@property(nonatomic,strong) NSMutableArray *messages;
@property(nonatomic,strong) NSDictionary *avatars;

@property(strong,nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;
@property(strong,nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property(strong,nonatomic) NSDictionary *users;

-(void)addPhotoMediaMessage;

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion;
-(void)addVideoMediaMessage;


@end
