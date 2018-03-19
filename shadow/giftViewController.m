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
    NSMutableArray *getTeamArray,*getCompanignArray;
    NSArray*sliderAllImages;
    NSString *teamId;
    NSString*stringButton;
}
@end

@implementation giftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    getCompanignArray=[[NSMutableArray alloc]init];
    getTeamArray=[[NSMutableArray alloc]init];
    
sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [self getTeamApi];
    [self getCampaignListingApi:teamId];
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
    
        return [getTeamArray count] ;
    
    }

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    
        GiftSliderCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"giftCellID" forIndexPath:indexPath];
    cell.userProfilePic.layer.cornerRadius = cell.userProfilePic.frame.size.width/2;
    cell.userProfilePic.clipsToBounds = YES;
    cell.userProfilePic.layer.borderWidth = 1.0f;
    cell.userProfilePic.layer.borderColor=[UIColor darkGrayColor].CGColor;
    [cell.userProfilePic sd_setImageWithURL:[NSURL URLWithString:[[getTeamArray  objectAtIndex:indexPath.row]valueForKey:@"logo"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];

        return cell;
            return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    teamId=[NSString stringWithFormat:@"%@",[[getTeamArray objectAtIndex:indexPath.row]valueForKey:@"id"]];
    [self getCampaignListingApi:teamId];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
   
    return [getCompanignArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"GiftTableViewCell";
    GiftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[GiftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    cell.userPic.layer.cornerRadius = cell.userPic.frame.size.width/2;
    cell.userPic.clipsToBounds = YES;
    cell.userPic.layer.borderWidth = 1.0f;
    cell.userPic.layer.borderColor=[UIColor darkGrayColor].CGColor;
    if ([[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"team_icon"]length]>0) {
          [cell.userPic sd_setImageWithURL:[NSURL URLWithString:[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"team_icon"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
    }
    else{
        cell.userPic.image =[UIImage imageNamed:@""];
    }
 
     if ([[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"campaign_img"]length]>0)
     {
     [cell.coverPic sd_setImageWithURL:[NSURL URLWithString:[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"campaign_img"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
    
     }
     else{
         cell.coverPic.image =[UIImage imageNamed:@""];
     }
    
    if ([[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"team_name"]length]>0)
    {
        cell.nameLabel.text=[NSString stringWithFormat:@"%@",[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"team_name"]];
    }
    else{
        cell.nameLabel.text=@"";
    }
    if ([[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"campaign_title"]length]>0)
    {
        cell.countryNameLbel.text=[NSString stringWithFormat:@"%@",[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"campaign_title"]];
    }
    else{
        cell.countryNameLbel.text=@"";
    }
   int distanceValue=[[NSString stringWithFormat:@"%@",[[getCompanignArray  objectAtIndex:indexPath.row]valueForKey:@"campaign_achieved"]] intValue];
    [cell.shiftslider setValue:distanceValue animated:YES];

       [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return  cell;
}
#pragma mark
#pragma mark Get TeamApi
#pragma mark
-(void)getTeamApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* Info= @{
                          @"access_token":[Utility valueForKey:access_token],
                          
                          };
    
    
    McomLOG(@"%@",Info);
    [API getTeamWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             getTeamArray=[responseDict valueForKey:@"data"];
             [giftCollectionView reloadData];
             
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


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([stringButton isEqualToString:@"Campanign"])
    {
        GiftDetailViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftDetailViewController"];
        secondView.giftcampaignDict = [getCompanignArray objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:secondView animated:YES];

    }
    else if ([stringButton isEqualToString:@"Merchandise"])
    {
        GiftMerchandiseDetailViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftMerchandiseDetailViewController"];
        
        [self.navigationController pushViewController:secondView animated:YES];
    }
   }
#pragma mark
#pragma mark Get campaign Api
#pragma mark
-(void)getCampaignListingApi:(NSString *)teamIdStrng
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* Info;
    if (teamIdStrng==0)
    {
        Info= @{
                              @"access_token":[Utility valueForKey:access_token],
                              @"filter_team_id":@"",
                              };
    }
    else
    {
  Info= @{
                          @"access_token":[Utility valueForKey:access_token],
                          @"filter_team_id":teamIdStrng,
                          };
    }
    
    McomLOG(@"%@",Info);
    [API getCampaignListingWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             getCompanignArray=[responseDict valueForKey:@"data"];
             [giftTableview reloadData];
             
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
    teamId=@"";
    [self getCampaignListingApi:teamId];
    
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
