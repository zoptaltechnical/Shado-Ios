//
//  CreateCampaignViewController.m
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "CreateCampaignViewController.h"

@interface CreateCampaignViewController ()

@end

@implementation CreateCampaignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    createCompaignBtn.layer.cornerRadius=20.0f;
    createCompaignBtn.clipsToBounds=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)backBtnPressed:(id)sender
{
[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)createCompaignBtnPressed:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    campaignUploadViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"campaignUploadViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

}
@end
