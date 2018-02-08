//
//  NewcreateDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 1/30/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "NewcreateDetailViewController.h"

@interface NewcreateDetailViewController ()

@end

@implementation NewcreateDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    editBtn.layer.cornerRadius=20.0f;
    editBtn.clipsToBounds=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)personalProfileBtnPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}
- (IBAction)likeBtnPressed:(id)sender {
}
- (IBAction)chatBtnPressd:(id)sender {
}
- (IBAction)shareBtnPressed:(id)sender {
}

- (IBAction)backBtnPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
