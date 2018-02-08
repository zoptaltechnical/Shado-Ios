//
//  ProfileViewController.h
//  shado
//
//  Created by Eshan cheema on 1/31/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
{
    
    IBOutlet UIButton *profileBtn;
    IBOutlet NSLayoutConstraint *locationHgtConst;
    IBOutlet NSLayoutConstraint *emailHgtConst;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *profileImage;
    IBOutlet UIButton *changePassBtn;
    IBOutlet UIButton *editBtn;
    IBOutlet UITextField *fullNameTextfield;
    IBOutlet UITextField *emailtextfield;
    IBOutlet UIImageView *profilePic;
    
    IBOutlet UIButton *saveBtn;
    IBOutlet UITextField *addresstextfield;
    IBOutlet UITextField *locationTextfield;
    IBOutlet UITextField *phoneNumTextfield;
}
@end
