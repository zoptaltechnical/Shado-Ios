//
//  GiftTableViewCell.h
//  shado
//
//  Created by Eshan cheema on 1/11/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *coverPic;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userPic;
@property (strong, nonatomic) IBOutlet UILabel *countryNameLbel;
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;

@end
