//
//  personalProfileViewController.m
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "personalProfileViewController.h"

@interface personalProfileViewController ()
{
    NSMutableArray *myPosts,*myPersonalInfo;
     }
@end

@implementation personalProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myPosts=[[NSMutableArray alloc]init];
    myPersonalInfo=[[NSMutableArray alloc]init];
    profilePic.layer.cornerRadius =  profilePic.frame.size.width / 2;
    profilePic.layer.masksToBounds = YES;
    [self getProfileDetailApi];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
   
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [myPosts count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    
        PersonalProfileCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCellID" forIndexPath:indexPath];
    
    [cell.imageview sd_setImageWithURL:[NSURL URLWithString:[[myPosts  objectAtIndex:indexPath.row]valueForKey:@"media_url"] ] placeholderImage:[UIImage imageNamed:@"1"] options:SDWebImageRefreshCached];

        return cell;
    }
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (ScreenHeight>=568) {
        return CGSizeMake(140.f, 170.f);

    }
    else
    {
        return CGSizeMake(173.f, 130.f);
    }
}
#pragma mark get Proile Detail Api:-
-(void)getProfileDetailApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API myProfileWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             myPosts=[responseDict valueForKey:@"my_posts"];
             myPersonalInfo=[responseDict valueForKey:@"profile_data"] ;
             [postCollectionView reloadData];
            
             if ([[myPersonalInfo  valueForKey:@"fullname"]length]>0)
             {
                 
                 fullNameLabel .text=[responseDict[@"profile_data"]  valueForKey:@"fullname"];
                 
             }
             else
             {
                 fullNameLabel.text=@"";
                 
                 
             }
             if ([[responseDict[@"profile_data"]   valueForKey:@"location"]length]>0)
             {
                 
                 locationLabel.text=[responseDict[@"profile_data"]  valueForKey:@"location"];
                 
             }
             else
             {
                 locationLabel.text=@"";
                 
                 
             }
             NSString *mediaType=[responseDict[@"profile_data"] valueForKey:@"media_type"];
             if ([mediaType isEqualToString:@"video"]) {
                   [profilePic sd_setImageWithURL:[NSURL URLWithString:[responseDict[@"profile_data"] valueForKey:@"media_thumb"]]placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
             }
             else{
             if ([[responseDict[@"profile_data"] valueForKey:@"profile_pic"]length]>0)
             {
                 [profilePic sd_setImageWithURL:[NSURL URLWithString:[responseDict[@"profile_data"] valueForKey:@"profile_pic"]]placeholderImage:[UIImage imageNamed:@"pro"] options:SDWebImageRefreshCached];
                 
             }
             else
             {
                 profilePic.image=[UIImage imageNamed:@"pro"];
                 
             }
             }
                          if ([[responseDict[@"profile_data"]  valueForKey:@"location"]length]>0)
                          {
                              addressLabel.text=[responseDict[@"profile_data"]  valueForKey:@"location"];
             
             
             
                          }
                          else
                          {
                              addressLabel.text=@"";
             
             
                          }
             //             if (  emailString.length>18)
             //             {
             //
             //
             //                 CGSize maximumLabelSize = CGSizeMake(300, 30);
             //
             //                 CGSize expectedLabelSize = [ emailString sizeWithFont: emailtextfield.font constrainedToSize:maximumLabelSize lineBreakMode:NSLineBreakByWordWrapping];
             //
             //                 emailtextfield.text=emailString;
             //                 CGRect newFrame =  emailtextfield.frame;
             //                 newFrame.size.height = expectedLabelSize.height;
             //                 emailHgtConst.constant=newFrame.size.height;
             //             }
             //             else
             //             {
             //
             //                 emailHgtConst.constant=30;
             //                 emailString= emailtextfield.text;
             //
             //             }
             //
             //
             //             if ([[responseDict[@"profile_data"]   valueForKey:@"phone"]length]>0)
             //             {
             //                 phoneNumTextfield.text=[responseDict[@"profile_data"]  valueForKey:@"phone"];
             //
             //             }
             //             else
             //             {
             //                 phoneNumTextfield.text=@"0";
             //             }
             //             [Utility setValue:@"1" forKey:callNotification];
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


- (IBAction)personalProfileView:(id)sender
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"profile" bundle:[NSBundle mainBundle]];
    ProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

    
}

- (IBAction)myCanpaignBtnPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    CreateCampaignViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateCampaignViewController"];
     loginViewController.buttonString=@"myCanpaign";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
    
    
}
- (IBAction)myMerchandiseBtnPressed:(id)sender {
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    CreateCampaignViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateCampaignViewController"];
  loginViewController.buttonString=@"myMerchandise";
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

}
- (IBAction)myTeamBtnPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    MyTeamViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"MyTeamViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    [self presentViewController:navController animated:YES completion:nil];
}
- (IBAction)myStatsBtnPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    StatsViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"StatsViewController"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    [self presentViewController:navController animated:YES completion:nil];
}
- (IBAction)alertFansBtnPressed:(id)sender {
}
- (IBAction)logoutBtnPressed:(id)sender
{
    UIViewController *popUpController = ViewControllerIdentifier(@"SignInViewController");
    [self.view.window setRootViewController:popUpController];
}

@end
