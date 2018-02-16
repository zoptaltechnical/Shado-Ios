//
//  campaignUploadViewController.h
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface campaignUploadViewController : UIViewController
{
    IBOutlet UIButton *uploadButton;
    
    __weak IBOutlet UITextField *campaignDurationTF;
    __weak IBOutlet UITextField *targetamtTF;
    __weak IBOutlet UITextView *descriptionTextview;
    __weak IBOutlet UITextField *campaignNameTF;
    IBOutlet UIButton *createcampaignBtn;
    IBOutlet UIView *uploadImageUiview;
    IBOutlet UIButton *backBtn;
}
@property (strong, nonatomic) IBOutlet UIButton *startDateBtn;
- (IBAction)startDateBtn:(id)sender;
- (IBAction)createCampaignBtnPressed:(id)sender;

@end
