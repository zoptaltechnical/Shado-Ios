//
//  CameraVideoViewController.m
//  
//
//  Created by Eshan cheema on 2/16/18.
//
//

#import "CameraVideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "LLSimpleCamera.h"
#import "ViewUtils.h"
#import "VideoViewController.h"
@interface CameraVideoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    BOOL isVideo;
    NSString *cammeraCheckString;

}
@property (strong, nonatomic) LLSimpleCamera *camera;
@property (strong, nonatomic) UILabel *errorLabel;
@property (strong, nonatomic) UIButton *snapButton;
@property (strong, nonatomic) UIButton *switchButton;
@property (strong, nonatomic) UIButton *nextButton;
@property (strong, nonatomic) UIButton *flashButton;
@end

@implementation CameraVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       [bottomView setHidden:NO];
    self.view.backgroundColor = [UIColor blackColor];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    // ----- initialize camera -------- //
    
    // create camera vc
    self.camera = [[LLSimpleCamera alloc] initWithQuality:AVCaptureSessionPresetHigh
                                                 position:LLCameraPositionRear
                                             videoEnabled:YES];
    
    // attach to a view controller
    [self.camera attachToViewController:self withFrame:CGRectMake(0,0, camView.size.width,  camView.size.height - 600)];
    

    // read: http://stackoverflow.com/questions/5427656/ios-uiimagepickercontroller-result-image-orientation-after-upload
    // you probably will want to set this to YES, if you are going view the image outside iOS.
    self.camera.fixOrientationAfterCapture = NO;
    // take the required actions on a device change
    __weak typeof(self) weakSelf = self;
    [self.camera setOnDeviceChange:^(LLSimpleCamera *camera, AVCaptureDevice * device) {
        
        NSLog(@"Device changed.");
        
        // device changed, check if flash is available
        if([camera isFlashAvailable]) {
            weakSelf.flashButton.hidden = NO;
            
            if(camera.flash == LLCameraFlashOff) {
                weakSelf.flashButton.selected = NO;
            }
            else {
                weakSelf.flashButton.selected = YES;
            }
        }
        else {
            weakSelf.flashButton.hidden = YES;
        }
    }];
    [self.camera setOnError:^(LLSimpleCamera *camera, NSError *error) {
        NSLog(@"Camera error: %@", error);
        
        if([error.domain isEqualToString:LLSimpleCameraErrorDomain]) {
            if(error.code == LLSimpleCameraErrorCodeCameraPermission ||
               error.code == LLSimpleCameraErrorCodeMicrophonePermission) {
                
                if(weakSelf.errorLabel) {
                    [weakSelf.errorLabel removeFromSuperview];
                }
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
                label.text = @"We need permission for the camera.\nPlease go to your settings.";
                label.numberOfLines = 2;
                label.lineBreakMode = NSLineBreakByWordWrapping;
                label.backgroundColor = [UIColor clearColor];
                label.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:13.0f];
                label.textColor = [UIColor whiteColor];
                label.textAlignment = NSTextAlignmentCenter;
                [label sizeToFit];
                label.center = CGPointMake(screenRect.size.width / 2.0f, screenRect.size.height / 2.0f);
                weakSelf.errorLabel = label;
                [weakSelf.view addSubview:weakSelf.errorLabel];
            }
        }
    }];
    self.snapButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.snapButton.frame = CGRectMake(0, 0, 70.0f, 70.0f);
    self.snapButton.clipsToBounds = YES;
    [self.snapButton setImage:[UIImage imageNamed:@"ic_btn"] forState:UIControlStateNormal];
    self.snapButton.layer.cornerRadius = self.snapButton.width / 2.0f;
//    self.snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.snapButton.layer.borderWidth = 2.0f;
    self.snapButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    self.snapButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.snapButton.layer.shouldRasterize = YES;
    [self.snapButton addTarget:self action:@selector(snapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.snapButton];

    // button to toggle flash
    self.flashButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.flashButton.frame = CGRectMake(0, 16.0f, 38.0f, 38.0f);//(0, 0, 16.0f + 20.0f, 38.0f +38.0f);
    self.flashButton.tintColor = [UIColor whiteColor];
    [self.flashButton setImage:[UIImage imageNamed:@"ic_light"] forState:UIControlStateNormal];
  //  self.flashButton.imageEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    [self.flashButton addTarget:self action:@selector(flashButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.flashButton];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.nextButton.frame = CGRectMake(0, 0, 29.0f + 20.0f, 22.0f + 20.0f);
    self.nextButton.tintColor = [UIColor redColor];
    [self.nextButton setTitle:@"Next" forState:UIControlStateNormal];
    
    self.nextButton.imageEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
    [self.nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
    
    if([LLSimpleCamera isFrontCameraAvailable] && [LLSimpleCamera isRearCameraAvailable]) {
        // button to toggle camera positions
        self.switchButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.switchButton.frame = CGRectMake(0, self.view.frame.size.height - 200 , 38.0f , 38.0f);
        self.switchButton.tintColor = [UIColor whiteColor];
        [self.switchButton setImage:[UIImage imageNamed:@"ic_ref"] forState:UIControlStateNormal];
       // self.switchButton.imageEdgeInsets = UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f);
        [self.switchButton addTarget:self action:@selector(switchButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.switchButton];
    }
    isVideo=NO;
    cammeraCheckString = @"camera";
    [photoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    
    [bottomView bringSubviewToFront:self.view];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // start the camera
    [self.camera start];
}

/* camera button methods */


- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
- (void)nextButtonPressed:(UIButton *)button
{
    if([cammeraCheckString isEqualToString:@"camera"])
    {
        [self.camera capture:^(LLSimpleCamera *camera, UIImage *image, NSDictionary *metadata, NSError *error)
         {
             if(!error)
             {
                 
                
             }
             else {
                 NSLog(@"An error has occured: %@", error);
             }
         } exactSeenImage:YES];
    }
}
- (void)flashButtonPressed:(UIButton *)button
{
    if(self.camera.flash == LLCameraFlashOff) {
        BOOL done = [self.camera updateFlashMode:LLCameraFlashOn];
        if(done) {
            self.flashButton.selected = YES;
            self.flashButton.tintColor = [UIColor redColor];
        }
    }
    else {
        BOOL done = [self.camera updateFlashMode:LLCameraFlashOff];
        if(done) {
            self.flashButton.selected = NO;
            self.flashButton.tintColor = [UIColor whiteColor];
        }
    }
}

- (void)snapButtonPressed:(UIButton *)button
{
    __weak typeof(self) weakSelf = self;
    
    if([cammeraCheckString isEqualToString:@"camera"])
    {
        // capture
        [self.camera capture:^(LLSimpleCamera *camera, UIImage *image, NSDictionary *metadata, NSError *error)
         {
            if(!error)
            {
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                CameraPostDetailViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CameraPostDetailViewController"];
                loginViewController.setImage=image;
                loginViewController.mediaName=@"picture";
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
                [navController setNavigationBarHidden:YES animated:YES];
                
                [self presentViewController:navController animated:YES completion:nil];
//                CameraPostDetailViewController *imageVC = [[CameraPostDetailViewController alloc] initWithImage:image];
//                [self presentViewController:imageVC animated:NO completion:nil];
            }
            else {
                NSLog(@"An error has occured: %@", error);
            }
        } exactSeenImage:YES];
        
    }
    else if([cammeraCheckString isEqualToString:@"video"])
    {
        if(!self.camera.isRecording) {
            self.flashButton.hidden = YES;
            self.switchButton.hidden = YES;
            
            self.snapButton.layer.borderColor = [UIColor redColor].CGColor;
            self.snapButton.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
            
            // start recording
            NSURL *outputURL = [[[self applicationDocumentsDirectory]
                                 URLByAppendingPathComponent:@"test1"] URLByAppendingPathExtension:@"mov"];
            [self.camera startRecordingWithOutputUrl:outputURL didRecord:^(LLSimpleCamera *camera, NSURL *outputFileUrl, NSError *error) {
                AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:outputFileUrl options:nil];
                AVAssetImageGenerator *generateImg = [[AVAssetImageGenerator alloc] initWithAsset:asset];
                CMTime time = CMTimeMake(1, 65);
                CGImageRef refImg = [generateImg copyCGImageAtTime:time actualTime:NULL error:&error];
                NSLog(@"error==%@, Refimage==%@", error, refImg);
                
              
                UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                CameraPostDetailViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"CameraPostDetailViewController"];
                loginViewController.setImage=[[UIImage alloc] initWithCGImage:refImg];
                loginViewController.mediaName=@"video";

                loginViewController.videoUrl=outputFileUrl;
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
                [navController setNavigationBarHidden:YES animated:YES];
                
                [self presentViewController:navController animated:YES completion:nil];
//                VideoViewController *vc = [[VideoViewController alloc] initWithVideoUrl:outputFileUrl];
//                [self.navigationController pushViewController:vc animated:YES];
            }];
            
        }
        else
        {
            self.flashButton.hidden = NO;
            self.switchButton.hidden = NO;
            //   [bottomView setHidden:NO];
            
            self.snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
            self.snapButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
            
            [self.camera stopRecording];
        }
    }
}

- (IBAction)libraryBtnPressed:(id)sender
{
    isVideo=NO;
    [libraryBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [videoBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [photoBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    cammeraCheckString = @"camera";
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self presentViewController:imagePickerController animated:YES completion:nil];

}
- (IBAction)photoBtnPressed:(id)sender
{
    isVideo=NO;
    cammeraCheckString = @"camera";
    [photoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [videoBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [libraryBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
}
- (IBAction)videoBtnPressed:(id)sender
{
    //    isVideo=YES;
    cammeraCheckString = @"video";
    [videoBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [photoBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [libraryBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
}
-(void)switchButtonPressed:(UIButton *)sender
{
      [self.camera togglePosition];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.camera.view.frame = camView.contentBounds;
    
    self.snapButton.center = camView.contentCenter;
    self.snapButton.bottom = self.view.height -100.0f;
    if (ScreenHeight==568)
    {
        self.flashButton.right = self.view.width-10;
        self.flashButton.bottom =470.0f;
    }
    else if (ScreenHeight>=667)
    {
        self.flashButton.right = self.view.width-10;
        self.flashButton.bottom =530.0f;
    }
   
    
    self.switchButton.bottom = 530.0f;
    self.switchButton.left = 40;
    
    self.nextButton.top = 40.0f;
    self.nextButton.right = self.view.width - 5.0f;
    }

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (UIInterfaceOrientation) preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
