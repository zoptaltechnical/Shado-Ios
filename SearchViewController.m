//
//  SearchViewController.m
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
{
    NSArray*sliderAllImages,*PostAllImages;
    NSString *searchString;
    BOOL isFilltered;
}
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sliderAllImages=[[NSArray alloc]init];
    PostAllImages=[[NSArray alloc]init];
    sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post"];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)personalProfileBtnPressed:(id)sender {
}
#pragma mark SearchButton Method
- (void)searchBarCancelButtonClicked:(UISearchBar *) SearchBar
{
    [searchBar resignFirstResponder];
    searchBar.text=@"";
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)SearchBar
{
    searchString=@"pressed";
    [self.view endEditing:YES];
    [searchBar isFirstResponder];
    [searchBar resignFirstResponder];
    
}
- (void)SearchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;
{
    if ([searchText length]==0)
    {
        isFilltered =NO;
    }
    else
    {
        
        isFilltered =YES;
        
    }
    
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
    else
    {
        return [PostAllImages count];
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
    else
    {
        HomePostCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePostCellID" forIndexPath:indexPath];
        cell.postImageView.layer.cornerRadius =8;
        cell.postImageView.clipsToBounds = YES;
        [cell.postImageView setImage:[UIImage imageNamed:[PostAllImages objectAtIndex:indexPath.row]]];
        return cell;
    }
   
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(collectionView == postCollectionView)
    {
         SearchDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchDetailViewController"];
        [self.navigationController pushViewController:tabBarController animated:YES];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == postCollectionView)
    {
        if (indexPath.row==0)
        {
            return CGSizeMake(140.f,180.f);
        }
        else if (indexPath.row==1)
        {
            return CGSizeMake(140.f, 280.f);
        }
        
        else if (indexPath.row==2)
        {
            return CGSizeMake(140.f, 280.f);
        }
        else if (indexPath.row==3)
        {
            return CGSizeMake(140.f, 180.f);
        }
        else if (indexPath.row==4)
        {
            return CGSizeMake(140.f, 280.f);
        }
        else if (indexPath.row==5)
        {
            return CGSizeMake(140.f, 180.f);
        }
        else
        {
            return CGSizeMake(140.f, 280.f);
           
                
              //  return [self.cellSizes[indexPath.item % 4] CGSizeValue];
            

        }
        
        
    }
    
    else
    {
        return CGSizeMake(80, 80);
        
        
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
