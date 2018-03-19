//
//  CameraVideoViewController.h
//  
//
//  Created by Eshan cheema on 2/16/18.
//
//

#import <UIKit/UIKit.h>

@interface CameraVideoViewController : UIViewController
{
    
    __weak IBOutlet UIView *camView;
    __weak IBOutlet UIView *bottomView;
    __weak IBOutlet UIButton *videoBtn;
    __weak IBOutlet UIButton *photoBtn;
    __weak IBOutlet UIButton *libraryBtn;
}
- (IBAction)btnVideoPress:(id)sender;
@end
