//
//  homeViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/15/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "homeViewController.h"
#import "HomeCollectionViewCell.h"
#import "HomePostCollectionViewCell.h"
#define CELL_COUNT 20
#define CELL_IDENTIFIER @"HomePostCellID"
#define HEADER_IDENTIFIER @"WaterfallHeader"
#define FOOTER_IDENTIFIER @"WaterfallFooter"
@interface homeViewController ()
{
    NSMutableArray *gethomeListingArray,*myHomePosts,*myHomeTeam;
    NSArray*sliderAllImages,*PostAllImages;
    NSString *secondCell,*teamString;
    NSString *teamIdStrg;
}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;

@end

@implementation homeViewController

- (void)viewDidLoad
{
    teamIdStrg=@"";
    gethomeListingArray=[[NSMutableArray alloc]init];
    myHomePosts=[[NSMutableArray alloc]init];
    myHomeTeam=[[NSMutableArray alloc]init];
    teamString=@"team";
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.view addSubview:self.collectionView];

    [super viewDidLoad];
    sliderAllImages=[[NSArray alloc]init];
    PostAllImages=[[NSArray alloc]init];
 sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post"];
     [self getHomeListing:teamIdStrg];
    [self intialFrontValue];
    
}
-(void)viewWillAppear:(BOOL)animated
{
   

}
-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (IBAction)profilebtnPressed:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}


-(void)intialFrontValue
{
    [teambtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
}
- (UICollectionView *)collectionView {
    if (!_collectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.headerHeight = 10;
        layout.footerHeight = 10;
        layout.minimumColumnSpacing = 20;
        layout.minimumInteritemSpacing = 30;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 190, self.view.frame.size.width, self.view.frame.size.height-230) collectionViewLayout:layout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[CHTCollectionViewWaterfallCell class]
            forCellWithReuseIdentifier:CELL_IDENTIFIER];
        [_collectionView registerClass:[CHTCollectionViewWaterfallHeader class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HEADER_IDENTIFIER];
        [_collectionView registerClass:[CHTCollectionViewWaterfallFooter class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionFooter
                   withReuseIdentifier:FOOTER_IDENTIFIER];
    }
    
    return _collectionView;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateLayoutForOrientation:[UIApplication sharedApplication].statusBarOrientation];
}


- (NSArray *)cellSizes {
    if (!_cellSizes) {
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(550, 550)],
                       [NSValue valueWithCGSize:CGSizeMake(1000, 665)],
                       [NSValue valueWithCGSize:CGSizeMake(1024, 689)],
                       [NSValue valueWithCGSize:CGSizeMake(640, 427)]
                       ];
    }
    return _cellSizes;
}

- (NSArray *)cats {
    if (!_cats) {
        _cats = @[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post"];
    }
    return _cats;
}
#pragma mark - Life Cycle

- (void)dealloc {
    _collectionView.delegate = nil;
    _collectionView.dataSource = nil;
}

#pragma mark
#pragma mark- UIButton action
#pragma mark

-(IBAction)allBtnPressed:(id)sender
{
    teamString=@"all";
    [allLine setHidden:NO];
    allLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLine.backgroundColor=[UIColor whiteColor];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    fanLine.backgroundColor=[UIColor whiteColor];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self getHomeListing:teamIdStrg];
    
}
-(IBAction)teamBtnPressed:(id)sender
{
    teamString=@"team";
    [teamLine setHidden:NO];
    teamLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [teambtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [fanLine setHidden:YES];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
   [self getHomeListing:teamIdStrg];
}

-(IBAction)fanbtnPressed:(id)sender
{
    teamString=@"fan";
    [fanLine setHidden:NO];
    fanLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [fanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [teamLine setHidden:YES];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
 [self getHomeListing:teamIdStrg];
}
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    [self updateLayoutForOrientation:toInterfaceOrientation];
}

- (void)updateLayoutForOrientation:(UIInterfaceOrientation)orientation {
    CHTCollectionViewWaterfallLayout *layout =
    (CHTCollectionViewWaterfallLayout *)self.collectionView.collectionViewLayout;
    layout.columnCount = UIInterfaceOrientationIsPortrait(orientation) ? 2 : 3;
}

#pragma mark
#pragma mark- CollectionView
#pragma mark

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView == sliderCollectionView)
    {
        return [myHomeTeam count];
    }
    else if(collectionView == _collectionView)
    {
        return [myHomePosts count];
    }
    else
    {
        return 0;
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    if(collectionView == sliderCollectionView)
    {
        HomeCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCellID" forIndexPath:indexPath];
        [cell.userProfilePic sd_setImageWithURL:[NSURL URLWithString:[[myHomeTeam  objectAtIndex:indexPath.row]valueForKey:@"logo"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];
        cell.userProfilePic.layer.cornerRadius = cell.userProfilePic.frame.size.width/2;
        cell.userProfilePic.clipsToBounds = YES;
         cell.userProfilePic.layer.borderWidth = 1.0f;
    cell.userProfilePic.layer.borderColor=[UIColor darkGrayColor].CGColor;
        return cell;
    }
    else if(collectionView == _collectionView)
    {
        CHTCollectionViewWaterfallCell *cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER   forIndexPath:indexPath];



      NSString *mediaType = [NSString stringWithFormat:@"%@",[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"media_type"]];
        if ([mediaType isEqualToString:@"picture"])
        {
            [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"media_url"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];


        }
        else
        {
             [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[myHomePosts  objectAtIndex:indexPath.row]valueForKey:@"media_thumb"] ] placeholderImage:[UIImage imageNamed:@""] options:SDWebImageRefreshCached];

        }


         cell.imageView.layer.cornerRadius =8;
         cell.imageView.clipsToBounds = YES;
        return cell;
    }
    else
    {
        return 0;
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(collectionView == _collectionView)
    {
        if ([[NSString stringWithFormat:@"%@",teamIdStrg]length]>0) {
            HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
            tabBarController.teamStrg=teamString;
             tabBarController.idStrg=teamIdStrg;
           
            [self.navigationController presentViewController:tabBarController animated:YES completion:nil];
        }
        else{
            HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
            tabBarController.teamStrg=teamString;
            
            // tabBarController.dicData=[myHomeTeam objectAtIndex:indexPath.row];
            [self.navigationController presentViewController:tabBarController animated:YES completion:nil];
        }
        
        
//    HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
//        tabBarController.idStrg=[NSString stringWithFormat:@"%@",[[myHomePosts objectAtIndex:indexPath.row]valueForKey:@"team_id"]];
//        tabBarController.teamStrg=teamString;
//        tabBarController.dicData=[myHomePosts objectAtIndex:indexPath.row];
//
//        [self.navigationController presentViewController:tabBarController animated:YES completion:nil];
    }
    else
    {
        teamIdStrg=[NSString stringWithFormat:@"%@",[[myHomeTeam objectAtIndex:indexPath.row]valueForKey:@"id"]];
        [self getHomeListing:teamIdStrg];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == _collectionView)
    {
       
            return CGSizeMake([[NSString stringWithFormat:@"%@",[[myHomePosts objectAtIndex:indexPath.row ] valueForKey:@"width"]] floatValue],[[[myHomePosts objectAtIndex:indexPath.row ] valueForKey:@"height"] floatValue]);
    }
    else
        {
            return CGSizeMake(80,80);
        }
//    else
//    {
//
//        return [self.cellSizes[indexPath.item % 4] CGSizeValue];
//    }

}
#pragma mark -Home Get listing Api
-(void)getHomeListing:(NSString *)idStrng
{
[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo= @{
                                @"access_token":[Utility valueForKey:access_token],
                                @"list_type":teamString,
                                @"filter_team_id":idStrng,
                                };
    

McomLOG(@"%@",MyProfileInfo);
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
         gethomeListingArray=[responseDict valueForKey:@"home_listing"];
         NSLog(@"all data %@",gethomeListingArray);
         myHomePosts=[gethomeListingArray valueForKey:@"posts"];
         NSLog(@"post %@",myHomePosts);
         [_collectionView reloadData];
         
          myHomeTeam=[gethomeListingArray valueForKey:@"teams"];
           NSLog(@"team slider list%@",myHomeTeam);
         [sliderCollectionView reloadData];
         //teamIdStrg=@"";
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



@end
