//
//  GiftCreditCardPaymentViewController.h
//  shado
//
//  Created by Eshan cheema on 1/23/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BKCardNumberField.h"
@interface GiftCreditCardPaymentViewController : UIViewController
{

    IBOutlet UIButton *prsonalProfileBtn;
IBOutlet UIButton *submitBtn;
IBOutlet UIButton *backButton;
}
@property (strong, nonatomic) IBOutlet BKCardNumberField *cardNumberField;
@end
