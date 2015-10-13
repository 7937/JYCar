//
//  ChatViewController.h
//  JYCar
//
//  Created by waveknns on 15/10/2.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <JSQMessagesViewController.h>

#import "JSQMessage.h"

@class ChatViewController;

@protocol JSQChatViewControllerDelegate <NSObject>

-(void)didDismissJSQDemoViewController:(ChatViewController *)vc;

@end

@interface ChatViewController : JSQMessagesViewController<JSQMessagesCollectionViewCellDelegate,JSQMessagesCollectionViewDataSource,JSQMessagesCollectionViewDelegateFlowLayout,UIActionSheetDelegate,JSQMessagesComposerTextViewPasteDelegate>





@end
