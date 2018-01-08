//
//  SignInViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/14/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "SignInViewController.h"
@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    signInButton.layer.cornerRadius =4;
    signInButton.clipsToBounds = YES;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)forgotBtnPressed:(id)sender
{
    forgotPasswordViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"forgotPasswordViewController"];
    [self.navigationController pushViewController:secondView animated:YES];
}

- (IBAction)signInBtnPressed:(id)sender
{
    UINavigationController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabControllerID"];
    [KAppdelegate.window setRootViewController:tabBarController];
  
}

- (IBAction)signUpBtnPressed:(id)sender
{
    SignUpViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerID"];
    [self.navigationController pushViewController:secondView animated:YES];

}



@end
