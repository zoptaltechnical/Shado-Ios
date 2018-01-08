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
    NSArray*profilePicImages,*PostAllImages,*nameArray;
    HomeDetailTableViewCell *cell;
    NSString *editString;
}
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     editString=@"Editstring";
     [cell.backTopview setHidden:YES];
 cell.descriptionBackgroundView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.9];
  cell.backTopview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    
    [teamBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLineLabel.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    profilePicImages=[[NSArray alloc]init];
    nameArray=[[NSArray alloc]init];

    PostAllImages=[[NSArray alloc]init];
    profilePicImages=@[@"img_team_logo",@"img_team_logo5",@"img_team_logo"];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post"];
    nameArray=@[@"Arkansas Football",@"Football Arkansas",@"Arkansas Football"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)backBtnpPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark
#pragma mark- UIButton action ALL,Team,fan
#pragma mark


-(IBAction)allBtnPressed:(id)sender
{
    [allLineLabel setHidden:NO];
    allLineLabel.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLineLabel.backgroundColor=[UIColor whiteColor];
    [teamBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    fanLineLabel.backgroundColor=[UIColor whiteColor];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
}

-(IBAction)teamBtnPressed:(id)sender
{
    [teamLineLabel setHidden:NO];
    teamLineLabel.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [teamBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [allLineLabel setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [fanLineLabel setHidden:YES];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

-(IBAction)fanbtnPressed:(id)sender
{
    [fanLineLabel setHidden:NO];
    fanLineLabel.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [fanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [teamLineLabel setHidden:YES];
    [teamBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allLineLabel setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
}


#pragma mark
#pragma mark- UITableView
#pragma mark


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    
        return [PostAllImages count];
        
    
    
}
- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
  
        static NSString *MyIdentifier = @"homeDetailCellID";
      cell = [TableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil)
        {
            cell = [[HomeDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
 

    [cell.profilePic setImage:[UIImage imageNamed:[profilePicImages objectAtIndex:indexPath.row]]];
   
    cell.profilePic.layer.cornerRadius = cell.profilePic.frame.size.height/2;
    cell.profilePic.clipsToBounds = YES;
     [cell.pic setImage:[UIImage imageNamed:[PostAllImages objectAtIndex:indexPath.row]]];
     cell.nameLabel.text = [nameArray objectAtIndex:indexPath.row];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(shareSelected:)];
    
    UITapGestureRecognizer *tapRecognizer1 = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer1 addTarget:self action:@selector(commentSelected:)];
//    UITapGestureRecognizer *tapRecognizer2 = [[UITapGestureRecognizer alloc] init];
//    [tapRecognizer2 addTarget:self action:@selector(moreSelected:)];
    cell.moreBtn.tag=indexPath.row;
    [cell.moreBtn addTarget:self action:@selector(moreSelected:) forControlEvents:UIControlEventTouchUpInside];
//     [cell.moreBtn addGestureRecognizer:tapRecognizer2];
    [cell.shareBtn addGestureRecognizer:tapRecognizer];
    [cell.commentBtn addGestureRecognizer:tapRecognizer1];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
cell.reportBtn.tag=indexPath.row;
    [cell.reportBtn addTarget:self action:@selector(reportSelected:) forControlEvents:UIControlEventTouchUpInside];
    cell.donateBtn.tag=indexPath.row;
    [cell.reportBtn addTarget:self action:@selector(donateSelected:) forControlEvents:UIControlEventTouchUpInside];

    return cell;
    
    
}
-(void)moreSelected:(UIButton*)sender
{
    if ([editString isEqualToString:@"Editstring"])
    {
        editString = @"nonediting";
        [cell.backTopview setHidden:NO];
        [cell.popupView setHidden:NO];


    }
    
    else if ([editString isEqualToString:@"nonediting"])
    {
        editString = @"Editstring";
        [cell.backTopview setHidden:YES];
  [cell.popupView setHidden:YES];
        
    }

    NSLog(@"%ld",(long)[sender tag]);
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
-(void)commentSelected :(UITapGestureRecognizer*)sender
{
}
- (void)presentActivityController:(UIActivityViewController *)controller {
    
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
//#pragma mark 
//#pragma mark UIButton Action :Report, Donate
//#pragma mark
-(void)reportSelected:(UIButton*)sender
{
    NSLog(@"%ld",(long)[sender tag]);
    [ cell.backTopview setHidden:YES];
}
-(void)donateSelected:(UIButton*)sender
{ NSLog(@"%ld",(long)[sender tag]);
    [cell.backTopview setHidden:YES];
    
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
