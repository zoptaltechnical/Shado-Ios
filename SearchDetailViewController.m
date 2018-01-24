//
//  SearchDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "SearchDetailViewController.h"

@interface SearchDetailViewController ()
{
    NSString *searchString;
    BOOL isFilltered;
}
@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


- (IBAction)personalProfileBtnPressed:(id)sender
{
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
    
    
    
    static NSString *MyIdentifier = @"SearchDetailCellID";
  SearchDetailTableViewCell*  cell = [TableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[SearchDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
    }
    
     cell.followBtn.layer.cornerRadius=15.0f;
     cell.followBtn.clipsToBounds=YES;
     cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.height/2;
     cell.profilePic.clipsToBounds = YES;
    cell.followBtn.tag=indexPath.row;
    [cell.followBtn addTarget:self action:@selector(followSelected:) forControlEvents:UIControlEventTouchUpInside];

     return cell;
    
    
}
-(void)followSelected:(id)sender
{
    SearchDetailFollowViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchDetailFollowViewController"];
    [self.navigationController pushViewController:tabBarController animated:YES];
  
        
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
