//
//  GiftMerchandiseViewController.m
//  shado
//
//  Created by Eshan cheema on 1/22/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "GiftMerchandiseViewController.h"

@interface GiftMerchandiseViewController ()
{
    NSArray*sliderAllImages,*postImages;
}
@end

@implementation GiftMerchandiseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_merchandiseBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    _merchandiseBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    _campaignBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
    [_campaignBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144.0f/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    
    postImages=@[@"img",@"img1",@"img",@"img1",@"img1",@"img1" ,@"img1",@"img1",@"img",@"img1",@"img1",@"img",@"img1",@"img1",@"img",@"img",@"img1",@"img1"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)campaignBtnPressed:(id)sender {
    [_campaignBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    _campaignBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    
    
    _merchandiseBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
    [_merchandiseBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
- (IBAction)merchandiseBtnPressed:(id)sender {
    [_merchandiseBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    _merchandiseBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    _campaignBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
    [_campaignBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144.0f/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
}

#pragma mark
#pragma mark- CollectionView
#pragma mark

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [sliderAllImages count] ;
    
}
- (IBAction)persoanlProfileBtnPressed:(id)sender {
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    if (collectionView==_sliderCollectionView)
    {
        GiftSliderCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"giftCellID" forIndexPath:indexPath];
        cell.userProfilePic.layer.cornerRadius =8;
        cell.userProfilePic.clipsToBounds = YES;
        [cell.userProfilePic setImage:[UIImage imageNamed:[sliderAllImages objectAtIndex:indexPath.row]]];
        return cell;
    }
    else
    {
        GiftMerchandiseCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GiftMerchCellID" forIndexPath:indexPath];
        cell.buyNowBtn.layer.cornerRadius=12.0f;
        cell.buyNowBtn.clipsToBounds=YES;
      [cell.imageView setImage:[UIImage imageNamed:[postImages objectAtIndex:indexPath.row]]];
        
        cell.subView.layer.cornerRadius=15.0f;
        cell.subView.clipsToBounds=YES;
        cell. subView.layer.borderColor = [UIColor colorWithRed:233.0f/255.f green:238.0f/255.f blue:239.0f/255.f alpha:1.0f].CGColor;
        cell.subView.layer.borderWidth = 1.0f;

        return cell;

    }
    
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
  
        GiftMerchandiseDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftMerchandiseDetailViewController"];
        [self.navigationController pushViewController:tabBarController animated:YES];
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==_merchandiseCollectionView)
    {

    if (ScreenHeight>=568)
    {
        return CGSizeMake(155.f, 239.f);

    }
    else if(ScreenHeight>=678){
        return CGSizeMake(150.f, 230.f);
    }
    else
    {
        return CGSizeMake(150.f, 239.f);
    }
    }
    else
    {
         return CGSizeMake(80.f, 80.f);
    }
}

@end
