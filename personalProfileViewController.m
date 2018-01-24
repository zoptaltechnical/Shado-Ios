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
     }
@end

@implementation personalProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    
        PersonalProfileCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ProfileCellID" forIndexPath:indexPath];
        
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
- (IBAction)myCanpaignBtnPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    CreateCampaignViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CreateCampaignViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
    
    
}
- (IBAction)myMerchandiseBtnPressed:(id)sender {
}
- (IBAction)myTeamBtnPressed:(id)sender {
}
- (IBAction)myStatsBtnPressed:(id)sender {
}
- (IBAction)alertFansBtnPressed:(id)sender {
}

@end
