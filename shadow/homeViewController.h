//
//  homeViewController.h
//  shadow
//
//  Created by Eshan cheema on 12/15/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface homeViewController : UIViewController
{
    IBOutlet UIImageView *pofilePic;
    IBOutlet UIButton *allBtn;
    IBOutlet UICollectionView *postCollectionView;
    
    IBOutlet UICollectionView *sliderCollectionView;
    IBOutlet UILabel *allLine;
    IBOutlet UIButton *teambtn;
    IBOutlet UILabel *teamLine;
    IBOutlet UIButton *fanBtn;
    IBOutlet UILabel *fanLine;
}
@end
