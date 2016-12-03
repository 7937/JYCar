//
//  ChatViewController.h
//  JYCar
//
//  Created by waveknns on 15/10/2.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <JSQMessagesViewController.h>

<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
#import "JSQMessage.h"
=======
#import "JSQMessages.h"
#import "NSUserDefaults+DemoSettings.h"

#import "ChatViewData.h"
>>>>>>> try to push

@class ChatViewController;

@protocol JSQChatViewControllerDelegate <NSObject>

-(void)didDismissJSQDemoViewController:(ChatViewController *)vc;

@end

<<<<<<< 8fa0dc075a6a855dd0b1d7ca2b7f30a4735b70a9
@interface ChatViewController : JSQMessagesViewController<JSQMessagesCollectionViewCellDelegate,JSQMessagesCollectionViewDataSource,JSQMessagesCollectionViewDelegateFlowLayout,UIActionSheetDelegate,JSQMessagesComposerTextViewPasteDelegate>




=======
@interface ChatViewController : JSQMessagesViewController<UIActionSheetDelegate,JSQMessagesComposerTextViewPasteDelegate,JSQMessagesCollectionViewDataSource,JSQMessagesCollectionViewDelegateFlowLayout>

@property (weak, nonatomic) id<JSQChatViewControllerDelegate> delegateModal;

@property (strong, nonatomic) ChatViewData *ChatData;

//- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

//- (void)closePressed:(UIBarButtonItem *)sender;
>>>>>>> try to push

@end
