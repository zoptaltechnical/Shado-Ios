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
    NSArray*sliderAllImages,*PostAllImages;
    NSString *secondCell;
}
@property (nonatomic, strong) NSArray *cellSizes;
@property (nonatomic, strong) NSArray *cats;

@end

@implementation homeViewController

- (void)viewDidLoad
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self.view addSubview:self.collectionView];

    [super viewDidLoad];
    sliderAllImages=[[NSArray alloc]init];
    PostAllImages=[[NSArray alloc]init];
    sliderAllImages=@[@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5" ,@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5",@"img_team_logo",@"img_team_logo1",@"img_team_logo2",@"img_team_logo3",@"img_team_logo4",@"img_team_logo5"];
    PostAllImages=@[@"img_post",@"img_post0",@"img_post",@"img_post0",@"img_post",@"img_post0" ,@"img_post"];
    
    [self intialFrontValue];
    
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    [allLine setHidden:NO];
    allLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    teamLine.backgroundColor=[UIColor whiteColor];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    fanLine.backgroundColor=[UIColor whiteColor];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    
}
-(IBAction)teamBtnPressed:(id)sender
{
    [teamLine setHidden:NO];
    teamLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [teambtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [fanLine setHidden:YES];
    [fanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
}

-(IBAction)fanbtnPressed:(id)sender
{
    [fanLine setHidden:NO];
    fanLine.backgroundColor=[UIColor colorWithRed:234.0/255.0f green:33.0/255.0f blue:66.0/255.0f alpha:1];
    [fanBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [teamLine setHidden:YES];
    [teambtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [allLine setHidden:YES];
    [allBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
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
        return [sliderAllImages count];
    }
    else if(collectionView == _collectionView)
    {
        return CELL_COUNT;
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
        
        [cell.userProfilePic setImage:[UIImage imageNamed:[sliderAllImages objectAtIndex:indexPath.row]]];
        return cell;
    }
    else if(collectionView == _collectionView)
    {
        CHTCollectionViewWaterfallCell *cell =
        (CHTCollectionViewWaterfallCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER
                                                                                    forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:self.cats[indexPath.item % 4]];
       

        
//        HomePostCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomePostCellID" forIndexPath:indexPath];
         cell.imageView.layer.cornerRadius =8;
         cell.imageView.clipsToBounds = YES;
//        [ cell.imageView setImage:[UIImage imageNamed:[PostAllImages objectAtIndex:indexPath.row]]];
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
    HomeDetailViewController *tabBarController = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeDetailViewController"];
    [self.navigationController pushViewController:tabBarController animated:YES];
    }
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == _collectionView)
    {
        //return [self.cellSizes[indexPath.item % 4] CGSizeValue];



        if (indexPath.row==0)
        {
            return CGSizeMake(140.f,180.f);
        }
        else if (indexPath.row==1)
        {
            return CGSizeMake(140.f, 280.f);
        }
        
        else if (indexPath.row==2)
        {
            return CGSizeMake(140.f, 280.f);
        }
        else if (indexPath.row==3)
        {
            return CGSizeMake(170.f, 180.f);
        }
        else if (indexPath.row==4)
        {
            return CGSizeMake(140.f, 260.f);
        }
        else if (indexPath.row==5)
        {
            return CGSizeMake(140.f, 280.f);
        }
        else
        {
            return CGSizeMake(140.f, 220.f);
        }
    }

    else if (collectionView == sliderCollectionView)
        {
            return CGSizeMake(80, 80);
           

        }
    else
    {
        
        return [self.cellSizes[indexPath.item % 4] CGSizeValue];
    }

}
#pragma mark - Navigation



@end
