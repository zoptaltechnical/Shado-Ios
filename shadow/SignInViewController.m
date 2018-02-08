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
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:secondView];
    [navController setNavigationBarHidden:YES animated:YES];
    [self presentViewController:navController animated:YES completion:nil];
    
}

- (IBAction)signInBtnPressed:(id)sender
{
    [self.view endEditing:YES];
    if ([[emailTextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your email address!"
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
    }
    else if (![Utility NSStringIsValidEmail:emailTextfield.text] && emailTextfield.text.length >0 &&![[[NSUserDefaults standardUserDefaults]valueForKey:@"IPHONELANGUAGE"] isEqualToString:@"ar"])
    {
       
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your valid email address!"
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
    }
    
    else if ([[passwordTextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
       
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter Password!"
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
    }
    else
    {

    [self callloginApi];
}
}

- (IBAction)signUpBtnPressed:(id)sender
{
   
    SignUpViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewControllerID"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
    
    
    
}
-(void)callloginApi
{
    [self.view endEditing:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSString*tokenID =[[NSUserDefaults standardUserDefaults]valueForKey:@"device_token"];
    NSLog(@"token%@",tokenID);
    if (!tokenID.length)
    {
        tokenID =@"12345678";
    }
    
    NSDictionary* loginInfo = @{
                                   @"email":emailTextfield.text,
                                   @"password":passwordTextfield.text,
                                   @"device_token":tokenID,
                                   @"device_type" :@"IOS"
                                   
                                   };
    
    McomLOG(@"%@",loginInfo);
    [API signInUserWithInfo:[loginInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         //[MBProgressHUD showHUDAddedTo:self.view animated:YES];
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         NSLog(@"dict_response>>. %@",dict_response);
         
         if ([responseDict[@"code"]  isEqualToString:@"201"])
         {
                 NSLog(@"error>>. %@",dict_response);
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@"AppIcon"]
                withDoneButtonTitle:nil
                         andButtons:nil];

          
         }
         else if ([responseDict[@"code"] isEqualToString:@"200"])
         {
             if ([responseDict valueForKey:@"login_data"])
             {
                 [[NSUserDefaults standardUserDefaults] setValue:@"Yes" forKey:@"LoggedIn"];
                 [[NSUserDefaults standardUserDefaults] synchronize];
                 [Utility setValue:[responseDict[@"login_data"] valueForKey:@"access_token"] forKey:access_token];
                NSLog(@"access%@",[Utility  valueForKey:@"access_token"]);
               
                 {
                     
                     
                     NSLog(@"sign_in responce Data>>%@", responseDict);
                     [[NSUserDefaults standardUserDefaults] setObject:[responseDict objectForKey:@"login_data"]forKey:@"loginData"];
                     [[NSUserDefaults standardUserDefaults] synchronize];
                     UINavigationController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTabControllerID"];
                     [KAppdelegate.window setRootViewController:tabBarController];

                     
                     
                 }
             }
         }
     }];
}

@end
