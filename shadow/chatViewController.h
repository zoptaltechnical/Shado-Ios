//
//  chatViewController.h
//  shado
//
//  Created by Macbook on 3/8/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatTableViewCell.h"
#import "TPKeyboardAvoidingTableView.h"
@interface chatViewController : UIViewController
{
    IBOutlet UIView *mainView;
    __weak IBOutlet UIButton *cancelButton;
    __weak IBOutlet UITextView *textView;
    __weak IBOutlet UIImageView *personalImageView;
    
    __weak IBOutlet UIView *tableviewSubview;
    
    __weak IBOutlet TPKeyboardAvoidingTableView *chatTbleview;
    __weak IBOutlet UIView *uiViewChatTextview;
}
@property (strong,nonatomic)NSString *teamStrng,*iD;

@property(strong,nonatomic)NSArray *dataArray;
@property(strong,nonatomic)NSDictionary *dictDataArray;

@end
