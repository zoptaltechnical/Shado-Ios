//
//  SearchDetailFollowViewController.m
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "SearchDetailFollowViewController.h"

@interface SearchDetailFollowViewController ()
{
    NSArray *PostAllImages;
}
@end

@implementation SearchDetailFollowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PostAllImages=[[NSArray alloc]init];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark
#pragma mark- CollectionView
#pragma mark

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
            return [PostAllImages count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
   
        HomePostCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePostCellID" forIndexPath:indexPath];
        cell.postImageView.layer.cornerRadius =8;
        cell.postImageView.clipsToBounds = YES;
        [cell.postImageView setImage:[UIImage imageNamed:[PostAllImages objectAtIndex:indexPath.row]]];
        return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(collectionView == postCollectionView)
    {
        HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
        [self.navigationController pushViewController:tabBarController animated:YES];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   
        if (indexPath.row%2==0)
        {
            return CGSizeMake(140.f, 220.f);
        }
        else if (indexPath.row%5==0)
        {
            return CGSizeMake(140.f, 240.f);
        }
        else if (indexPath.row%9==0)
        {
            return CGSizeMake(140.f, 280.f);
        }
        else if (indexPath.row%13==0)
        {
            return CGSizeMake(140.f, 320.f);
        }
        else{
            return CGSizeMake(140.f, 220.f);
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
