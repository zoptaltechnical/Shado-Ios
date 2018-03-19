//
//  MyTeamViewController.m
//  shado
//
//  Created by Gorav Grover on 23/02/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "MyTeamViewController.h"
#import "MyTeamTableViewTableViewCell.h"
@interface MyTeamViewController ()

@end

@implementation MyTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    assistantCoachRemoveBtn.layer.cornerRadius=20.0f;
     assistantCoachRemoveBtn.clipsToBounds=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backBtnPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)assistantCoachBtnPresed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    SearchTeamViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"SearchTeamViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}
- (IBAction)playersBtnPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    SearchTeamViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"SearchTeamViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
   
    return 3;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


   
        static NSString *CellIdentifier =@"MyTeamTableViewTableViewCellID";
       MyTeamTableViewTableViewCell *cell = [tableView
                dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    cell. playersTeamRemoveBtn.layer.cornerRadius=20.0f;
    cell.playersTeamRemoveBtn.clipsToBounds=YES;

        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

        return cell;
    }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 73;
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
