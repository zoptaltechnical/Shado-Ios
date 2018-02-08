//
//  forgotPasswordViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/14/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "forgotPasswordViewController.h"

@interface forgotPasswordViewController ()

@end

@implementation forgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender {
   [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)submitBtnPressed:(id)sender
{
    [self.view endEditing:YES];
    if ([[emailTextFld.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
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
    else if (![Utility NSStringIsValidEmail:emailTextFld.text] && emailTextFld.text.length >0 &&![[[NSUserDefaults standardUserDefaults]valueForKey:@"IPHONELANGUAGE"] isEqualToString:@"ar"])
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
    
    else
    {
        [self CallForgotPasswordApi];
    }
    
}
-(void)CallForgotPasswordApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSDictionary* registerInfo = @{
                                   @"email":emailTextFld.text,
                                   @"Device_type":@"IOS",
                                   };
    
    McomLOG(@"%@",registerInfo);
    [API ForgotPasswrodWithInfo:[registerInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
          [MBProgressHUD showHUDAddedTo:self.view animated:YES];
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([dict_response[@"code"]  isEqualToString:@"201"])
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
                    withCustomImage:[UIImage imageNamed:@"AppIcon"]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
             
         }
         else  if ([dict_response[@"code"]  isEqualToString:@"200"])
         {
             NSLog(@"respnse> %@",dict_response);
             
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
