//
//  CreateMerchandiseViewController.h
//  shado
//
//  Created by Eshan cheema on 1/30/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateMerchandiseViewController : UIViewController
{
    
    IBOutlet UIView *uploadUiView;
    IBOutlet UITextField *priceTextfield;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *productTitleTextField;
    IBOutlet UIButton *backBtn;
    IBOutlet UIButton *personalProfileBtn;
    IBOutlet UIButton *uploadPhotoBtn;
    IBOutlet UIButton *createMerchandiseBtn;
    IBOutlet UITextView *descriptionTextview;
}
@end
