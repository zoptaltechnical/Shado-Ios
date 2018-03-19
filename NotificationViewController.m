//
//  NotificationViewController.m
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()
{
    NSMutableArray *getNotiArray;
}
@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    getNotiArray=[[NSMutableArray alloc]init];
    [self getNotifiactionApi];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
      [self getNotifiactionApi];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)personalProfileBtnPressed:(id)sender {
}
#pragma mark
#pragma mark- UITableView
#pragma mark


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return 10;
    
}
- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    
    static NSString *MyIdentifier = @"NotificationCellID";
    NotificationTableViewCell * cell = [TableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[NotificationTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
//    cell.followBtn.layer.cornerRadius=15.0f;
//    cell.followBtn.clipsToBounds=YES;
//    cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.height/2;
//    cell.profilePic.clipsToBounds = YES;
//    cell.followBtn.tag=indexPath.row;
//    [cell.followBtn addTarget:self action:@selector(followSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
    
}
#pragma mark -Home Get listing Api
-(void)getNotifiactionApi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* Info= @{
                                   @"access_token":[Utility valueForKey:access_token],
                                  
                                   };
    
    
    McomLOG(@"%@",Info);
    [API getNotificationWithInfo:[Info mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
             getNotiArray=[responseDict valueForKey:@"data"];
             
             
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
