//
//  changePasswordViewController.m
//  shado
//
//  Created by Eshan cheema on 1/31/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "changePasswordViewController.h"

@interface changePasswordViewController ()

@end

@implementation changePasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    submitButton.layer.cornerRadius=20.0f;
    submitButton.clipsToBounds=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
- (IBAction)backbtn:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)personalProfileBtn:(id)sender
{
}
- (IBAction)submitBtnPressed:(id)sender
{
     [self callValidations];
}
-(void)callValidations
{
    [self.view endEditing:YES];
    if ([[oldPasswordtextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter old password."
               withCustomImage:[UIImage imageNamed:@""]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
    }
    
    
    else if ([[newPasswordtextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter new password."
               withCustomImage:[UIImage imageNamed:@""]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
    }
        else if ([[confirmPasswordtextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter confirm password."
               withCustomImage:[UIImage imageNamed:@""]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
        
        
        
        
        
    }
        else if (newPasswordtextfield.text=confirmPasswordtextfield.text)
        {
            FCAlertView *alert = [[FCAlertView alloc] init];
            alert.bounceAnimations = YES;
            alert.animateAlertInFromTop = YES;
            alert.avoidCustomImageTint = YES;
            alert.detachButtons = YES;
            alert.blurBackground = YES;
            
            [alert showAlertInView:self
                         withTitle:@"Shado Sport"
                      withSubtitle:@"Password do not match."
                   withCustomImage:[UIImage imageNamed:@""]
               withDoneButtonTitle:nil
                        andButtons:nil];
            
            
            
            
            
            
            
        }
    
    
    
    
    else
    {
        [self callChangePasswordApi];
        [self.view endEditing:YES];
        
    }
}
-(void)callChangePasswordApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    @"old_password":oldPasswordtextfield.text,
                                    @"password":confirmPasswordtextfield.text,
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API ChangePasswordWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([dict_response[@"code"] isEqualToString:@"201"])
         {
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@""]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
             
         }
         
         
         else if ([dict_response[@"code"] isEqualToString:@"200"])
         {
             NSLog(@"change password> %@",responseDict);
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@""]
                withDoneButtonTitle:nil
                         andButtons:nil];

         }
         
         
         else
         {
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@""]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
             
             
             
             
             
         }
         
         
     }];
    
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
