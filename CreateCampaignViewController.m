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
    
    if ([_buttonString isEqualToString:@"myCanpaign"])
    {
          [createCompaignBtn setTitle:@"Create Campaign" forState:UIControlStateNormal];
        labelName.text=@"No Campaign Yet";
    }
    else if ([_buttonString isEqualToString:@"myMerchandise"]){
    
    
     [createCompaignBtn setTitle:@"Create Merchandise" forState:UIControlStateNormal];
        labelName.text=@"No Merchandise Yet";
    }

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
    if ([_buttonString isEqualToString:@"myCanpaign"])
    {
    

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    campaignUploadViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"campaignUploadViewController"];
    
    [self presentViewController:loginViewController animated:YES completion:nil];
    }
    else if ([_buttonString isEqualToString:@"myMerchandise"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
        CreateMerchandiseViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateMerchandiseViewController"];
        
        [self presentViewController:loginViewController animated:YES completion:nil];

    }

}
@end
