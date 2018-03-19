//
//  ChatTableViewCell.h
//  shado
//
//  Created by Macbook on 3/8/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userProfilePic;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userMessagelabel;
@property (weak, nonatomic) IBOutlet UILabel *userTime;
@property (weak, nonatomic) IBOutlet UIButton *like;

@end
