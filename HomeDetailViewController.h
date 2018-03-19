//
//  HomeDetailViewController.h
//  shado
//
//  Created by Eshan cheema on 12/22/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDetailViewController : UIViewController<CZPickerViewDataSource, CZPickerViewDelegate>
{
    
   
    
    __weak IBOutlet UITableView *homeDetailTableview;
    IBOutlet UIButton *profileBtn;
    
    IBOutlet UIButton *backButton;
  
}
@property (nonatomic,strong)NSString *idStrg,*temaStrg;
@property (nonatomic,strong)NSString *teamStrg;
@property (nonatomic,strong)NSDictionary *dicData;

@end
