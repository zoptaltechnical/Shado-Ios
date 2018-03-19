//
//  chatViewController.m
//  shado
//
//  Created by Macbook on 3/8/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "chatViewController.h"

@interface chatViewController ()

@end

@implementation chatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textView.text=@" Type your Comment..";
    textView.textColor=[UIColor lightGrayColor];
   mainView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    [self callMyProfileAPi];
    [chatTbleview reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    NSLog(@"arry listing %@",_dataArray);
    return [_dataArray count];
    
}
- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    static NSString *MyIdentifier = @"chatCell";
   ChatTableViewCell* cell = [TableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[ChatTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
    cell.userProfilePic.layer.cornerRadius = cell.userProfilePic.frame.size.height/2;
   cell.userProfilePic.clipsToBounds = YES;
    cell.userNameLabel.text=[[_dataArray objectAtIndex:indexPath.row]valueForKey:@"fullname"];
     cell.userMessagelabel.text=[[_dataArray objectAtIndex:indexPath.row]valueForKey:@"comment"];
    
     cell.userTime.text=[[_dataArray objectAtIndex:indexPath.row]valueForKey:@"created_at"];
      [cell.userProfilePic sd_setImageWithURL:[NSURL URLWithString:[[_dataArray  objectAtIndex:indexPath.row]valueForKey:@"user_image"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];

    [cell.like setTitle:[NSString stringWithFormat:@"%@ Like",[[_dataArray objectAtIndex:indexPath.row]valueForKey:@"total_likes"]] forState:UIControlStateNormal];
      [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
   
    return cell;
    
    
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//#pragma mark:Call Report Post Api
//-(void)callreportPostApi
//{
//    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    NSDictionary*Info = @{
//                          @"access_token":[Utility valueForKey:access_token],
//                          @"post_id": ,
//                          @"comment":textView.text,
//                          };
//
//    McomLOG(@"%@",Info);
//    [API sendReportReasonsWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
//     {
//         [MBProgressHUD hideHUDForView:self.view animated:YES];
//         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
//         if ([dict_response[@"code"] isEqualToString:@"201"])
//         {
//             FCAlertView *alert = [[FCAlertView alloc] init];
//             alert.bounceAnimations = YES;
//             alert.animateAlertInFromTop = YES;
//             alert.avoidCustomImageTint = YES;
//             alert.detachButtons = YES;
//             alert.blurBackground = YES;
//
//             [alert showAlertInView:self
//                          withTitle:@"Shado Sport"
//                       withSubtitle:[responseDict valueForKey:@"message"]
//                    withCustomImage:[UIImage imageNamed:@""]
//                withDoneButtonTitle:nil
//                         andButtons:nil];
//         }
//
//
//         else if ([dict_response[@"code"] isEqualToString:@"200"])
//         {
//             NSLog(@"sendReport id %@",responseDict);
//
//             FCAlertView *alert = [[FCAlertView alloc] init];
//             alert.bounceAnimations = YES;
//             alert.animateAlertInFromTop = YES;
//             alert.avoidCustomImageTint = YES;
//             alert.detachButtons = YES;
//             alert.blurBackground = YES;
//
//             [alert showAlertInView:self
//                          withTitle:@"Shado Sport"
//                       withSubtitle:[responseDict valueForKey:@"message"]
//                    withCustomImage:[UIImage imageNamed:@""]
//                withDoneButtonTitle:nil
//                         andButtons:nil];
//
//         }
//
//
//         else
//         {
//             FCAlertView *alert = [[FCAlertView alloc] init];
//             alert.bounceAnimations = YES;
//             alert.animateAlertInFromTop = YES;
//             alert.avoidCustomImageTint = YES;
//             alert.detachButtons = YES;
//             alert.blurBackground = YES;
//
//             [alert showAlertInView:self
//                          withTitle:@"Shado Sport"
//                       withSubtitle:[responseDict valueForKey:@"message"]
//                    withCustomImage:[UIImage imageNamed:@""]
//                withDoneButtonTitle:nil
//                         andButtons:nil];
//
//         }
//
//
//     }];
//
//
//}
#pragma mark
#pragma mark My profile Api
#pragma mark
-(void)callMyProfileAPi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API myProfileWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             
             
          
             
             
             
             personalImageView.layer.cornerRadius = personalImageView.frame.size.height/2;
            personalImageView.clipsToBounds = YES;
             
             if ([[responseDict[@"profile_data"] valueForKey:@"profile_pic"]length]>0)
             {
                 [personalImageView sd_setImageWithURL:[NSURL URLWithString:[responseDict[@"profile_data"] valueForKey:@"profile_pic"]]placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
                 
             }
             else
             {
                 personalImageView.image=[UIImage imageNamed:@"pro"];
                 
             }
             
             
             [Utility setValue:@"1" forKey:callNotification];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
