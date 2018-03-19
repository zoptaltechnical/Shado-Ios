//
//  SearchTeamViewController.m
//  shado
//
//  Created by Gorav Grover on 23/02/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "SearchTeamViewController.h"
#import "searchTeamTableViewCell.h"
@interface SearchTeamViewController ()

@end

@implementation SearchTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)profileBtnPressed:(id)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return 2;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *CellIdentifier =@"searchTeamTableViewCellID";
    searchTeamTableViewCell *cell = [tableView
                                          dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.addBtn.layer.cornerRadius=15.0f;
    cell.addBtn.clipsToBounds=YES;
    
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
