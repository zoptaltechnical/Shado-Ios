//
//  SearchDetailFollowViewController.h
//  shado
//
//  Created by Eshan cheema on 1/24/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchDetailFollowViewController : UIViewController

{
     IBOutlet UIButton *backBtn;
    IBOutlet UIButton *followBtn;
    IBOutlet UIImageView *profilePic;
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *descLabel;
    IBOutlet UICollectionView *postCollectionView;
}
@end
