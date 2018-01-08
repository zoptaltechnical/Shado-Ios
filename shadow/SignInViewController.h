//
//  SignInViewController.h
//  shadow
//
//  Created by Eshan cheema on 12/14/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPKeyboardAvoidingScrollView.h"

@interface SignInViewController : UIViewController
{
    IBOutlet UITextField *emailTextfield;
    
    IBOutlet TPKeyboardAvoidingScrollView *scrollview;
    IBOutlet UITextField *passwordTextfield;
    IBOutlet UIButton *forgotPasswordBtn;
    IBOutlet UIButton *signInButton;
    IBOutlet UIButton *signUpBtn;
}
@end
