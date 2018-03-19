//
//  personalProfileViewController.h
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface personalProfileViewController : UIViewController
{
    __weak IBOutlet UILabel *addressLabel;
    
    __weak IBOutlet UIImageView *profilePic;
    __weak IBOutlet UILabel *descriptionLabel;
    __weak IBOutlet UILabel *locationLabel;
    __weak IBOutlet UILabel *fullNameLabel;
    __weak IBOutlet UICollectionView *postCollectionView;
    IBOutlet UIButton *myCanpaignBtn;
    IBOutlet UIButton *myMerchandiseBtn;
    IBOutlet UIButton *myTeamBtn;
    IBOutlet UIButton *myStats;
    IBOutlet UIButton *alertFans;
}
@end
