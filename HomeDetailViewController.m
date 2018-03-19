//
//  HomeDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 12/22/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeDetailTableViewCell.h"
@interface HomeDetailViewController ()
{
    CZPickerView *CVVCZPicker1;
    NSMutableArray * gethomeListingArray,
   * myHomePosts,
    *myHomeTeam,*postCmomment,*getReportListing;
    HomeDetailTableViewCell *cell;
    NSString *editString,*likePressed,*PostIdStrg,*idString;
    int selectedIndx;
}
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     editString=@"Editstring";
  //  likePressed=@"1";
    [cell.likeStatusLable setHidden:YES];
     [cell.backTopview setHidden:YES];
 cell.descriptionBackgroundView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.9];
  cell.backTopview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    gethomeListingArray=[[NSMutableArray alloc]init];
    myHomePosts=[[NSMutableArray alloc]init];
        myHomeTeam=[[NSMutableArray alloc]init];
    postCmomment=[[NSMutableArray alloc]init];
getReportListing=[[NSMutableArray alloc]init];
    selectedIndx = 1000000000;
    cell.reportBtn.layer.cornerRadius=30.0f;
    cell.reportBtn.clipsToBounds=YES;
      cell.donateBtn.layer.cornerRadius=30.0f;
     cell.donateBtn.clipsToBounds=YES;
    [self gradientcolor];
    [self getHomeListing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)backBtnpPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
-(void)gradientcolor
{
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = cell.descriptionBackgroundView.bounds;
    gradientMask.colors = @[(id)[UIColor whiteColor].CGColor,
                            (id)[UIColor clearColor].CGColor];
    cell.descriptionBackgroundView.layer.mask = gradientMask;
}
#pragma mark
#pragma mark- UITableView
#pragma mark


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
        return [myHomePosts count];
     
}
- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
 

        static NSString *MyIdentifier = @"homeDetailCellID";
      cell = [TableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[HomeDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
 
    NSDictionary *dicData = [myHomePosts  objectAtIndex:indexPath.row];
    [cell.profilePic sd_setImageWithURL:[NSURL URLWithString:[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"team_icon"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
     [cell.pic sd_setImageWithURL:[NSURL URLWithString:[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"media_url"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
    cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.height/2;
    cell.profilePic.clipsToBounds = YES;
     cell.nameLabel.text = [NSString stringWithFormat:@"%@",[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"team_name"]];
    cell.descriptionLabel.text = [NSString stringWithFormat:@"%@",[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"description"]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(shareSelected:)];
    
   

    cell.moreBtn.tag=indexPath.row;
    [cell.moreBtn addTarget:self action:@selector(moreSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self gradientcolor];
    [cell.shareBtn addGestureRecognizer:tapRecognizer];
    
    cell.commentBtn.tag=indexPath.row;
        [cell.commentBtn addTarget:self action:@selector(commentSelected:) forControlEvents:UIControlEventTouchUpInside];
   
    
    cell.reportBtn.tag=indexPath.row;
    [cell.reportBtn addTarget:self action:@selector(reportSelected:) forControlEvents:UIControlEventTouchUpInside];
    cell.donateBtn.tag=indexPath.row;
    [cell.donateBtn addTarget:self action:@selector(donateSelected:) forControlEvents:UIControlEventTouchUpInside];
    cell.likeBtn.tag=indexPath.row;
     cell.likeBtn.tag =1;
    
    
    NSString* likebyme = [dicData valueForKey:@"post_liked"] ;
    if ([[likebyme lowercaseString] isEqualToString:@"yes"]) {
        [cell.likeBtn setSelected:true];
    }
    else
    {
        [cell.likeBtn setSelected:false];

    }
    int totallike =[[dicData valueForKey:@"total_likes"] intValue];
    if (totallike > 0)
    {
        cell.likeStatusLable.text = [NSString stringWithFormat:@"%D Likes",totallike];
        cell.likeStatusLable.hidden = false;
        
    }
    else
    {
        cell.likeStatusLable.hidden = true;

        
    }
    
    if (indexPath.row == selectedIndx) {
        cell.backTopview.hidden = false;
    }
    else
    {
        cell.backTopview.hidden = true;
    }
    cell.likeBtn.tag = indexPath.row;
 [cell.likeBtn addTarget:self action:@selector(likeSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
    
}
#pragma mark -Home Get listing Api
-(void)getHomeListing
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo;
    if (_idStrg ==0) {
        MyProfileInfo= @{
                         @"access_token":[Utility valueForKey:access_token],
                         @"list_type":_teamStrg,
                         @"filter_team_id":@"",
                         };
    }
    else{
    MyProfileInfo= @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    @"list_type":_teamStrg,
                                    @"filter_team_id":_idStrg,
                                    };
    }
    
    McomLOG(@"homeDetail%@",MyProfileInfo);
    [API myHomeListingWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
                myHomePosts=[[responseDict valueForKey:@"home_listing"][@"posts"] mutableCopy];
             [homeDetailTableview reloadData];
             
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


-(void)likeSelected:(id)sender
{
    
     NSLog(@"like index> %ld",(long)[sender tag]);
   
        
         PostIdStrg =  [NSString stringWithFormat:@"%@",[[myHomePosts objectAtIndex:[sender tag]]valueForKey:@"id"] ] ;
        [self getHomeLike:[sender tag]];

}
#pragma mark -Home Get listing Api
-(void)getHomeLike:(int)selecteddindx
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    @"post_id":PostIdStrg,
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API myHomeDetailLikeWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             NSLog(@"like pressed %@",responseDict);
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
             dic = [[myHomePosts objectAtIndex:selecteddindx ] mutableCopy];
             NSString* likebyme = [dic valueForKey:@"post_liked"] ;
              int totallike =[[dic valueForKey:@"total_likes"] intValue];
             if ([[likebyme lowercaseString] isEqualToString:@"yes"]) {
                 [dic setValue:@"no" forKey:@"post_liked"];
                 totallike=totallike-1;
             }
             else
             {
                 [dic setValue:@"yes" forKey:@"post_liked"];
                   totallike=totallike+1;
             }
             
             [dic setValue:[NSString stringWithFormat:@"%d",totallike]  forKey:@"total_likes"];
             
             [myHomePosts removeObjectAtIndex:selecteddindx];
             [myHomePosts insertObject:dic atIndex:selecteddindx];
             NSIndexPath *indexPath = [NSIndexPath indexPathForRow:selecteddindx inSection:0];

             [homeDetailTableview beginUpdates];
             [homeDetailTableview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
             [homeDetailTableview endUpdates];
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@""]
                withDoneButtonTitle:nil
                         andButtons:nil];
             [homeDetailTableview reloadData];
             
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
#pragma mark More Button
-(void)moreSelected:(id)sender
{
     NSLog(@"%ld",(long)[sender tag]);
    if (selectedIndx == [sender tag]) {
        selectedIndx = 100000000;
    }
    else
    {
    selectedIndx = [sender tag];
    }
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    [homeDetailTableview beginUpdates];
    [homeDetailTableview reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    [homeDetailTableview endUpdates];
    
    

 
}
#pragma mark
#pragma mark - Get ReportListing Api
#pragma mark
-(void)getReportListing
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary*Info = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    };
    
    McomLOG(@"%@",Info);
    [API getReportWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             NSLog(@"reportListing %@",responseDict);
             
             getReportListing=[responseDict valueForKey:@"report_reason_listing"];
             CVVCZPicker1 = [[CZPickerView alloc] initWithHeaderTitle:@"Select" cancelButtonTitle:@"Cancel" confirmButtonTitle:@"Confirm"];
             CVVCZPicker1.delegate = self;
             CVVCZPicker1.dataSource = self;
             CVVCZPicker1.needFooterView = YES;
             [self.view endEditing:YES];
             [CVVCZPicker1 show];
             
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

-(void)shareSelected :(UITapGestureRecognizer*)sender
{
    NSString *theMessage = @"Hello";
    NSArray *items = @[theMessage];
    
    // build an activity view controller
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:items applicationActivities:nil];
    
    // and present it
    [self presentActivityController:controller];
}
- (void)presentActivityController:(UIActivityViewController *)controller
{
    
    // for iPad: make the presentation a Popover
    controller.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:controller animated:YES completion:nil];
    
    UIPopoverPresentationController *popController = [controller popoverPresentationController];
    popController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popController.barButtonItem = self.navigationItem.leftBarButtonItem;
    
    // access the completion handler
    controller.completionWithItemsHandler = ^(NSString *activityType,
                                              BOOL completed,
                                              NSArray *returnedItems,
                                              NSError *error){
        // react to the completion
        if (completed) {
            // user shared an item
            NSLog(@"We used activity type%@", activityType);
        } else {
            // user cancelled
            NSLog(@"We didn't want to share anything after all.");
        }
        
        if (error) {
            NSLog(@"An Error occured: %@, %@", error.localizedDescription, error.localizedFailureReason);
        }
    };
}
#pragma mark Chat Button
-(void)commentSelected :(UIButton *)sender
{
    NSLog(@"%ld",(long)[sender tag]);
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    chatViewController *myNewVC = (chatViewController *)[storyboard instantiateViewControllerWithIdentifier:@"chatViewController"];
    
    
    myNewVC.dataArray=[[myHomePosts objectAtIndex:[sender tag]] valueForKey:@"post_comments"];
   // myNewVC.iD=[_dicData objectForKey:@"id"];
    myNewVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:myNewVC animated:YES completion:nil];

    
    
}



#pragma mark: Report Button
-(void)reportSelected:(UIButton*)sender
{
    NSLog(@"%ld",(long)[sender tag]);
    [ cell.backTopview setHidden:YES];
    PostIdStrg =  [NSString stringWithFormat:@"%@",[[myHomePosts objectAtIndex:[sender tag]]valueForKey:@"id"] ] ;
    [self  getReportListing];
    
}
#pragma mark
#pragma mark CzPickerView
#pragma mark
- (NSString *)czpickerView:(CZPickerView *)pickerView
               titleForRow:(NSInteger)row
{

        //return [[listSaveCardsArray objectAtIndex:row] valueForKey:@"card_number"];
      //  return [[ListSaveCardsIDArray objectAtIndex:row]valueForKey:@"id"];
    return [[getReportListing objectAtIndex:row]valueForKey:@"reason_content"];
}
- (NSInteger)numberOfRowsInPickerView:(CZPickerView *)pickerView
{
    return getReportListing.count;
}
- (void)czpickerView:(CZPickerView *)pickerView didConfirmWithItemAtRow:(NSInteger)row {
    NSLog(@"%@ is chosen!",getReportListing[row]);
    idString=@"";
  NSString *name=[NSString stringWithFormat:@"%@",[getReportListing[row]valueForKey:@"reason_content"] ];
    idString=[idString stringByAppendingString:[NSString stringWithFormat:@"%@",[getReportListing[row] valueForKey:@"id"]]];
    [self  callreportPostApi];
}
//
//
- (void)czpickerViewDidClickCancelButton:(CZPickerView *)pickerView
{
    [self.navigationController setNavigationBarHidden:YES];
    NSLog(@"Canceled.");
}

- (void)czpickerViewWillDisplay:(CZPickerView *)pickerView
{
    NSLog(@"Picker will display.");
}
- (void)czpickerViewDidDisplay:(CZPickerView *)pickerView
{
    NSLog(@"Picker did display.");
}

- (void)czpickerViewWillDismiss:(CZPickerView *)pickerView
{
    NSLog(@"Picker will dismiss.");
}

- (void)czpickerViewDidDismiss:(CZPickerView *)pickerView
{

        [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark:Call Report Post Api
-(void)callreportPostApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary*Info = @{
                          @"access_token":[Utility valueForKey:access_token],
                          @"post_id":PostIdStrg,
                            @"reason_id":idString,
                          };
    
    McomLOG(@"%@",Info);
    [API sendReportReasonsWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             NSLog(@"sendReport id %@",responseDict);
             
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

#pragma mark: Donate Button
-(void)donateSelected:(UIButton*)sender
{ NSLog(@"%ld",(long)[sender tag]);
    [cell.backTopview setHidden:YES];
    
}
#pragma mark: personal Profile Button
- (IBAction)profilebtnPressed:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
            personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
            [navController setNavigationBarHidden:YES animated:YES];
    
            [self presentViewController:navController animated:YES completion:nil];
}



@end
