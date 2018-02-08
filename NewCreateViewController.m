//
//  NewCreateViewController.m
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "NewCreateViewController.h"

@interface NewCreateViewController ()
{
      NSArray*sliderAllImages;
}
@end

@implementation NewCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)personalProfileBtnPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
    
}
- (IBAction)backBtnPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark
#pragma mark- CollectionView
#pragma mark

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [sliderAllImages count] ;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    
    GiftSliderCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"giftCellID" forIndexPath:indexPath];
    cell.userProfilePic.layer.cornerRadius =8;
    cell.userProfilePic.clipsToBounds = YES;
    [cell.userProfilePic setImage:[UIImage imageNamed:[sliderAllImages objectAtIndex:indexPath.row]]];
    return cell;
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"CreateCamCellID";
    CreateCampaignTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[CreateCampaignTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    NewcreateDetailViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"NewcreateDetailViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

    
        
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
