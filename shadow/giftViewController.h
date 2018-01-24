//
//  giftViewController.h
//  shado
//
//  Created by Eshan cheema on 1/11/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface giftViewController : UIViewController

{
    IBOutlet UIButton *merchandiseBtn;
    
    IBOutlet UIButton *persoanlProfileBtn;
    IBOutlet UIButton *campaignBtn;
}
- (IBAction)campaignBtnPressed:(id)sender;
- (IBAction)merchandiseBtnPressed:(id)sender;
@end
