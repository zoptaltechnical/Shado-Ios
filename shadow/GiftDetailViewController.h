//
//  GiftDetailViewController.h
//  shado
//
//  Created by Eshan cheema on 1/11/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GiftDetailViewController : UIViewController
{
    IBOutlet UIButton *backButton;
    
    IBOutlet UIButton *popUpDonateBtn;
    IBOutlet UIView *popUpview;
    IBOutlet UIView *backgroundView;
    IBOutlet UIButton *doanteBtn;
    
    
    
    IBOutlet UIButton *priceAmtBtnone;
    
    IBOutlet UIButton *priceAmtBtnTwo;
    
    IBOutlet UIButton *priceAmtBtnThree;
    IBOutlet UIButton *priceAmtBtnFour;
    
 
    
    IBOutlet UIButton *priceAmtBtnFifth;
    
    IBOutlet UIButton *priceAmtBtnSixth;
    
    IBOutlet UIButton *priceAmtBtnSeventh;
    
    IBOutlet UIButton *priceAmtBtnEigth;
    
    IBOutlet UIButton *priceAmtBtnNine;
       IBOutlet UIButton *otherAmtBtn;
}
- (IBAction)backBtnPressed:(id)sender;
@end
