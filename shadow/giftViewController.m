//
//  giftViewController.m
//  shado
//
//  Created by Eshan cheema on 1/11/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "giftViewController.h"

@interface giftViewController ()

{
    NSArray*sliderAllImages;
    NSString*stringButton;
}
@end

@implementation giftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    stringButton=@"Campanign";
    [campaignBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    campaignBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    
    
    merchandiseBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
    [merchandiseBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
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
    static NSString *MyIdentifier = @"GiftTableViewCell";
    GiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[GiftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([stringButton isEqualToString:@"Campanign"])
    {
        GiftDetailViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftDetailViewController"];
        
        [self.navigationController pushViewController:secondView animated:YES];

    }
    else if ([stringButton isEqualToString:@"Merchandise"])
    {
        GiftMerchandiseDetailViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftMerchandiseDetailViewController"];
        
        [self.navigationController pushViewController:secondView animated:YES];
    }
   }

- (IBAction)persoanlProfileBtnPressed:(id)sender {
    

        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
        personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [navController setNavigationBarHidden:YES animated:YES];
        
        [self presentViewController:navController animated:YES completion:nil];
    

}


- (IBAction)campaignBtnPressed:(id)sender
{
    
    
     stringButton=@"Campanign";
    [campaignBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    campaignBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    
    
    merchandiseBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
      [merchandiseBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    
     

}
- (IBAction)merchandiseBtnPressed:(id)sender
{
     stringButton=@"Merchandise";
    [merchandiseBtn setTitleColor:[UIColor colorWithRed:236.0f/255.0f green:36.0f/255.0f blue:64.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    merchandiseBtn.backgroundColor=[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0] ;
    campaignBtn.backgroundColor=[UIColor colorWithRed:233.0f/255.0f green:238/255.0f blue:239/255.0f alpha:1.0];
    [campaignBtn setTitleColor:[UIColor colorWithRed:143.0f/255.0f green:144.0f/255.0f blue:146.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    GiftMerchandiseViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftMerchandiseViewController"];
    
    [self.navigationController pushViewController:secondView animated:YES];

    
    
    

}
@end
