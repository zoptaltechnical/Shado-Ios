//
//  CameraPostDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 2/19/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "CameraPostDetailViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"
#import "AFURLConnectionOperation.h"
@interface CameraPostDetailViewController ()<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) AVPlayer *avPlayer;
@property (strong, nonatomic) AVPlayerLayer *avPlayerLayer;
@property (strong, nonatomic) UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIImageView *pic;

@end

@implementation CameraPostDetailViewController
{
    NSData *imageData ,*videoData , *uploadingVideoData;
 NSDictionary  *dic;
    BOOL imageBtnBool ;
    
}
@synthesize avPlayer;
- (instancetype)initWithVideoUrlGet:(NSURL *)url
{
    self = [super init];
    if(self) {
        _videoUrl = url;
    }
    
    return self;
}

- (void)viewDidLoad {
        [super viewDidLoad];
    [self.view endEditing:YES];
if([_mediaName isEqual:@"picture"])
{
    imageData=nil;
    [self.pic setHidden:NO];
    self.pic.image = self.setImage;
   imageData = UIImagePNGRepresentation(self.setImage);
   // [_videoView setHidden:YES];
    imageBtnBool =YES;
}
else if([_mediaName isEqual:@"video"])
{
    imageData=nil;
    [self.pic setHidden:YES];
    imageData = UIImagePNGRepresentation(self.setImage);
    
    
    uploadingVideoData = [NSData dataWithContentsOfFile:_videoUrl];
    [self addPlayer:_videoUrl];
    
}
}
-(void)addPlayer:(NSURL*)url
{
    if (!avPlayer) {
        
        
        avPlayer = [AVPlayer playerWithURL:url];
        AVPlayerViewController *controller = [[AVPlayerViewController alloc] init];
        
        [self addChildViewController:controller];
        [_videoView addSubview:controller.view];
        
        controller.view.frame = CGRectMake(0,0,self.view.frame.size.width,_videoView.frame.size.height);
        controller.player = avPlayer;
        controller.showsPlaybackControls = YES;
        avPlayer.closedCaptionDisplayEnabled = NO;
        
        [avPlayer pause];
        [avPlayer play];
    }
    else
    {
        avPlayer = [AVPlayer playerWithURL:url];
        [avPlayer pause];
        [avPlayer play];
        
    }
    
}
- (void)playerFailedToPlayToEnd {
    NSLog(@"Error: could not play video");
}
- (void)viewTapped:(UIGestureRecognizer *)gesture {
    [descriptionTextview resignFirstResponder];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.avPlayer play];
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}
- (IBAction)postNowBtnPressed:(id)sender

{
    if ([_mediaName isEqualToString:@"picture"]) {
        
    
    [self.view endEditing:YES];
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    //Set Params
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:60];
    [request setHTTPMethod:@"POST"];
    
    //Create boundary, it can be anything
    NSString *boundary = @"----WebKitFormBoundary7MA4YWxkTrZu0gW";
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    //Populate a dictionary with all the regular values you would like to send.
  
    // new app parameter
      NSMutableDictionary*  dict=[[NSMutableDictionary alloc]init];

    [dict setValue:[Utility valueForKey:access_token] forKey:@"access_token"];
    [dict setValue:@"" forKey:@"team_id"];
    [dict setValue:@"" forKey:@"title"];
    [dict setValue:descriptionTextview.text forKey:@"description"];
    [dict setValue:_mediaName forKey:@"media_type"];
   // [dict setValue:organisationTextfield.text forKey:@"media_url"];
    // add params (all params are strings)profile_pic
    for (NSString *param in dict)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [dict objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    //Assuming data is not nil we add this to the multipart form
    if (imageBtnBool)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png\"\r\n",@"media_url"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type:image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        imageBtnBool = NO;
    }
    //Close off the request with the boundary
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the request
    [request setHTTPBody:body];
    
    // set URL
    NSURL *url1 = [NSURL URLWithString:WebURl@"add_post"];
    [request setURL:url1];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    }
                                                    else {
                                                        [RunOnMainThread runBlockInMainQueueIfNecessary:^{
                                                            [ MBProgressHUD hideHUDForView:self.view animated:YES];
                                                            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                            //  NSLog(@"%@", httpResponse);
                                                            NSString *responseString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                                                            dic = [[NSDictionary alloc]init];
                                                            dic = [NSJSONSerialization JSONObjectWithData:data options:
                                                                   
                                                                   NSJSONReadingAllowFragments error:nil];
                                                            
                                                            NSLog(@"Key values%@",dic);
                                                            [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                            
                                                            
                                                        }];
                                                        
                                                        
                                                        
                                                        NSString *status = [NSString stringWithFormat:@"nn>> %@",[dic objectForKey:@"Status"]];
                                                        if ([status isEqualToString:@"ERROR"]) {
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                
                                                            });
                                                        }
                                                        
                                                        else{
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                
                                                                
                                                            });
                                                        }
                                                        
                                                    }
                                                }];
    [dataTask resume];
    
}
    else
    {
      NSMutableDictionary*  dict=[[NSMutableDictionary alloc]init];

        NSDictionary* registerInfo;
        registerInfo= @{
                        @"access_token":[Utility valueForKey:access_token],
                        @"team_id":@"",
                        @"title":@"",
                        @"media_type":_mediaName,
                        @"description":@"hello im sending new video",
                       
                        };
        [dict setObject:registerInfo forKey:@"parameters"];
        
       
        [self UploadCard:imageData videoData:uploadingVideoData dictionary:registerInfo];

    }
}

#pragma mark - Multipart Image Uploading

-(void)UploadCard:(NSData*)imageData videoData:(NSData*)videoData dictionary:(NSDictionary*)dictionary
{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",@"https://zoptal.com/demo/shado/api/add_post"]]];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"multipart/form-data", nil];
    
    [manager.requestSerializer setTimeoutInterval:100];
    
    AFHTTPRequestOperation *op = [manager POST:[NSString stringWithFormat:@"%@",@"https://zoptal.com/demo/shado/api/add_post"] parameters:dictionary constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if (imageData) {
            [formData appendPartWithFileData:imageData name:@"media_thumb" fileName:@"frontimage.png" mimeType:@"image/png"];
            
        }
        if (videoData) {
            [formData appendPartWithFileData:videoData name:@"media_url" fileName:@"backimage.mov" mimeType:@".mov"];
            
        }
        
        [ MBProgressHUD showHUDAddedTo:self.view animated:YES];

        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        
        [ MBProgressHUD hideHUDForView:self.view animated:YES];

        
        NSLog(@"%@",responseObject);
        
        if([[responseObject valueForKey:@"result"] intValue] == 0)
        {
            
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Alert"
                                         message:[responseObject valueForKey:@"message"]
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* noButton = [UIAlertAction
                                       actionWithTitle:@"Ok"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {}];
            [alert addAction:noButton];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        else
        {
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Alert"
                                         message:[responseObject valueForKey:@"message"]
                                         preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* noButton = [UIAlertAction
                                       actionWithTitle:@"Ok"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           [self.navigationController popViewControllerAnimated:YES];
                                       }];
            
            [alert addAction:noButton];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                                  {
                                      
                                    [ MBProgressHUD hideHUDForView:self.view animated:YES];
                                      
                                      UIAlertController * alert = [UIAlertController
                                                                   alertControllerWithTitle:@"Alert"
                                                                   message:@"Something went wrong"
                                                                   preferredStyle:UIAlertControllerStyleAlert];
                                      UIAlertAction* noButton = [UIAlertAction
                                                                 actionWithTitle:@"Ok"
                                                                 style:UIAlertActionStyleDefault
                                                                 handler:^(UIAlertAction * action)
                                                                 {
                                                                 }];
                                      [alert addAction:noButton];
                                      [self presentViewController:alert animated:YES completion:nil];
                                  }];
    [op start];
}
/*- (IBAction)postNowBtnPressed:(id)sender
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    @"team_id":@"",
                                    @"title":@"",
                                    @"description":descriptionTextview.text,
                                    @"media_type":@"picture",
                                    @"media_url":@"",
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API addPostWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
     {
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         NSDictionary *dict_response = [[NSDictionary alloc]initWithDictionary:responseDict];
         
         if ([dict_response[@"code"] isEqualToString:@"201"])
         {
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@""]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
             
         }
         
         
         else if ([dict_response[@"code"] isEqualToString:@"200"])
         {
             NSLog(@"change password> %@",responseDict);
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@"AppIcon"]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
         }
         
         
         else
         {
             FCAlertView *alert = [[FCAlertView alloc] init];
             alert.bounceAnimations = YES;
             alert.animateAlertInFromTop = YES;
             alert.avoidCustomImageTint = YES;
             alert.detachButtons = YES;
             alert.blurBackground = YES;
             
             [alert showAlertInView:self
                          withTitle:@"Shado Sport"
                       withSubtitle:[responseDict valueForKey:@"message"]
                    withCustomImage:[UIImage imageNamed:@"AppIcon"]
                withDoneButtonTitle:nil
                         andButtons:nil];
             
             
             
             
             
             
         }
         
         
     }];
    
    
}


*/
    


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
