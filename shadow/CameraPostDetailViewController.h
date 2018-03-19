//
//  CameraPostDetailViewController.h
//  shado
//
//  Created by Eshan cheema on 2/19/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^completionBlock) (BOOL succeeded, NSArray *resultArray);
typedef void (^failureBlock) (BOOL succeeded, NSArray *failureArray);
@interface CameraPostDetailViewController : UIViewController
{
    
    __weak IBOutlet UITextView *descriptionTextview;
    __weak IBOutlet UIButton *backBtn;
}
- (instancetype)initWithVideoUrlGet:(NSURL *)url;

@property(strong,nonatomic) UIImage* setImage;
@property(strong,nonatomic) NSURL* videoUrl;

@property(strong,nonatomic) NSString* mediaName;
@end
