//
//  changePasswordViewController.h
//  shado
//
//  Created by Eshan cheema on 1/31/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface changePasswordViewController : UIViewController
{
    IBOutlet UIButton *submitButton;
    
    IBOutlet UIButton *personalProfileBtn;
    IBOutlet TPKeyboardAvoidingScrollView *scrollview;
    IBOutlet UITextField *oldPasswordtextfield;
    IBOutlet UITextField *newPasswordtextfield;
    IBOutlet UITextField *confirmPasswordtextfield;
}
@end
