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
    NSString *editString,*likePressed;
}
@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     editString=@"Editstring";
    likePressed=@"1";
    [cell.likeStatusLable setHidden:YES];
     [cell.backTopview setHidden:YES];
 cell.descriptionBackgroundView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.9];
  cell.backTopview.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.4];
    
    [teamBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLineLabel.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    profilePicImages=[[NSArray alloc]init];
    nameArray=[[NSArray alloc]init];

    PostAllImages=[[NSArray alloc]init];
    profilePicImages=@[@"img_team_logo",@"img_team_logo5",@"img_team_logo"];
    PostAllImages=@[@"img_post0",@"img_post0",@"img_post0"];
    nameArray=@[@"Arkansas Football",@"Football Arkansas",@"Arkansas Football"];
    [self gradientcolor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)backBtnpPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

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
        return [PostAllImages count];
     
}
- (UITableViewCell *)tableView:(UITableView *)TableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    [cell.likeStatusLable setHidden:YES];

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

    cell.moreBtn.tag=indexPath.row;
    [cell.moreBtn addTarget:self action:@selector(moreSelected:) forControlEvents:UIControlEventTouchUpInside];
    [self gradientcolor];
    [cell.shareBtn addGestureRecognizer:tapRecognizer];
    [cell.commentBtn addGestureRecognizer:tapRecognizer1];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
cell.reportBtn.tag=indexPath.row;
    [cell.reportBtn addTarget:self action:@selector(reportSelected:) forControlEvents:UIControlEventTouchUpInside];
    cell.donateBtn.tag=indexPath.row;
    [cell.donateBtn addTarget:self action:@selector(donateSelected:) forControlEvents:UIControlEventTouchUpInside];
    cell.likeBtn.tag=indexPath.row;
     cell.likeBtn.tag =1;
 [cell.likeBtn addTarget:self action:@selector(likeSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
    
    
}
-(void)likeSelected:(id)sender
{
    
     NSLog(@"like index> %ld",(long)[sender tag]);
    if ([sender tag] == 1)
    {
        likePressed =@"0";

        [cell.likeBtn setImage:[UIImage imageNamed:@"ic_like_red"] forState:UIControlStateNormal ];
        [cell.likeStatusLable setHidden:NO];
    }
   
    
    else if ([likePressed isEqualToString:@"0"])
    {
        likePressed =@"1";
        [cell.likeBtn setImage:[UIImage imageNamed:@"ic_like"] forState:UIControlStateNormal];
        [cell.likeStatusLable setHidden:YES];
    }

}
-(void)moreSelected:(id)sender
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
- (IBAction)profilebtnPressed:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
            personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
            [navController setNavigationBarHidden:YES animated:YES];
    
            [self presentViewController:navController animated:YES completion:nil];
}



@end
