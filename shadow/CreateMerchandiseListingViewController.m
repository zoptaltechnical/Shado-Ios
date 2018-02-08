//
//  CreateMerchandiseListingViewController.m
//  shado
//
//  Created by Eshan cheema on 1/30/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "CreateMerchandiseListingViewController.h"

@interface CreateMerchandiseListingViewController ()
{
    NSArray *postImages;
}
@end

@implementation CreateMerchandiseListingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    postImages=@[@"img",@"img1",@"img",@"img1",@"img1",@"img1" ,@"img1",@"img1",@"img",@"img1",@"img1",@"img",@"img1",@"img1",@"img",@"img",@"img1",@"img1"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [postImages count] ;
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
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
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    
//    GiftMerchandiseDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftMerchandiseDetailViewController"];
//    [self.navigationController pushViewController:tabBarController animated:YES];
    
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView==merchandiseCollectionview)
    {
        
        if (ScreenHeight>=568)
        {
            return CGSizeMake(155.f, 239.f);
            
        }
        else if(ScreenHeight>=678)
        {
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
