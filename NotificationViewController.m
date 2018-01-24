//
//  NotificationViewController.m
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
