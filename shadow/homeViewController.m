//
//  homeViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/15/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "homeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomePostCollectionViewCell.h"
@interface homeViewController ()
{
    NSArray*sliderAllImages,*PostAllImages;
    NSString *secondCell;
}
@end

@implementation homeViewController

- (void)viewDidLoad
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    
    [super viewDidLoad];
    
    sliderAllImages=[[NSArray alloc]init];
    PostAllImages=[[NSArray alloc]init];
    sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0"];
    
    [self intialFrontValue];
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(void)intialFrontValue
{
    [teambtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
}
#pragma mark
#pragma mark- UIButton action
#pragma mark

-(IBAction)allBtnPressed:(id)sender
{
    [allLine setHidden:NO];
    allLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLine.backgroundColor=[UIColor whiteColor];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    fanLine.backgroundColor=[UIColor whiteColor];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
}
-(IBAction)teamBtnPressed:(id)sender
{
    [teamLine setHidden:NO];
    teamLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [teambtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [fanLine setHidden:YES];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

-(IBAction)fanbtnPressed:(id)sender
{
    [fanLine setHidden:NO];
    fanLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [fanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [teamLine setHidden:YES];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
}

#pragma mark
#pragma mark- CollectionView
#pragma mark

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView == sliderCollectionView)
    {
        return [sliderAllImages count];
    }
    else if(collectionView == postCollectionView)
    {
        return [PostAllImages count];
    }
    else
    {
        return 0;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    if(collectionView == sliderCollectionView)
    {
        HomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCellID" forIndexPath:indexPath];
        
        [cell.userProfilePic setImage:[UIImage imageNamed:[sliderAllImages objectAtIndex:indexPath.row]]];
        return cell;
    }
    else if(collectionView == postCollectionView)
    {
        HomePostCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePostCellID" forIndexPath:indexPath];
        cell.postImageView.layer.cornerRadius =8;
        cell.postImageView.clipsToBounds = YES;
        [cell.postImageView setImage:[UIImage imageNamed:[PostAllImages objectAtIndex:indexPath.row]]];
        return cell;
    }
    else
    {
        return 0;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
    [self.navigationController pushViewController:tabBarController animated:YES];
    
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if(collectionView == postCollectionView)
//    {
//
//        return CGSizeMake(150.f, 230.f);
//    }
//
//    else if (collectionView == sliderCollectionView)
//        {
//            return CGSizeMake(55, 55);
//        }
//
//    else
//    {
//    return CGSizeMake(150.f, 230.f);
//    }

//}
#pragma mark - Navigation



@end
