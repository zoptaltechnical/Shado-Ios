//
//  CreateCampaignViewController.h
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateCampaignViewController : UIViewController
{
    
    IBOutlet UILabel *labelName;
    IBOutlet UIButton *createCompaignBtn;
}
- (IBAction)createCompaignBtnPressed:(id)sender;
@property (nonatomic,strong) NSString *buttonString;
@end
