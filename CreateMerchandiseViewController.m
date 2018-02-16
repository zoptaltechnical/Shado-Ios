//
//  CreateMerchandiseViewController.m
//  shado
//
//  Created by Eshan cheema on 1/30/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "CreateMerchandiseViewController.h"

@interface CreateMerchandiseViewController ()

@end

@implementation CreateMerchandiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    uploadUiView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    uploadUiView.layer.borderWidth = 1.0f;
    createMerchandiseBtn.layer.cornerRadius=20.0f;
    createMerchandiseBtn.clipsToBounds=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)persoanlProfileBtnPressed:(id)sender
{
}
- (IBAction)uploadPhotoBtn:(id)sender
{
}
- (IBAction)createMerchandiseBtnPressed:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    CreateMerchandiseListingViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateMerchandiseListingViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
    
    
    
    
}
#pragma mark
#pragma mark TextField delegate
#pragma mark
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"1");
    //[textField resignFirstResponder];
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"2");
    [textField resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"3");
    if (textField == productTitleTextField)
    {
        [priceTextfield becomeFirstResponder];
    }
    else if (textField == priceTextfield)
    {
        [descriptionTextview becomeFirstResponder];
    }
    else if (textField == descriptionTextview)
    {
        [descriptionTextview resignFirstResponder];
    }
    
    
    [textField resignFirstResponder];
    return YES;
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
