//
//  HomeDetailTableViewCell.h
//  shado
//
//  Created by Eshan cheema on 12/22/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *backTopview;
@property (strong, nonatomic) IBOutlet UIImageView *pic;

@property (strong, nonatomic) IBOutlet UIView *popupView;
@property (strong, nonatomic) IBOutlet UIButton *reportBtn;
@property (strong, nonatomic) IBOutlet UIButton *donateBtn;
@property (strong, nonatomic) IBOutlet UIImageView *profilePic;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIButton *likeBtn;
@property (strong, nonatomic) IBOutlet UIButton *commentBtn;
@property (strong, nonatomic) IBOutlet UIButton *moreBtn;
@property (strong, nonatomic) IBOutlet UIButton *shareBtn;
@property (strong, nonatomic) IBOutlet UIView *descriptionBackgroundView;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@end
