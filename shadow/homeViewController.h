//
//  homeViewController.h
//  shadow
//
//  Created by Eshan cheema on 12/15/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHTCollectionViewWaterfallLayout.h"

@interface homeViewController : UIViewController<UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>
{
    IBOutlet UIButton *allBtn;
  //  IBOutlet UICollectionView *postCollectionView;
    
    IBOutlet UICollectionView *sliderCollectionView;
    IBOutlet UILabel *allLine;
    IBOutlet UIButton *teambtn;
    IBOutlet UILabel *teamLine;
    IBOutlet UIButton *fanBtn;
    IBOutlet UILabel *fanLine;
}
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end
