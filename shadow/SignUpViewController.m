//
//  SignUpViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/14/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()
{
    NSData* imageData;
    BOOL imageBtnBool ;
    UIImage *currentSelectedImage;
    NSDictionary  *dic;
    NSString*isFromImagePicker;
    NSURL *imagePath;
    NSString *myString;
    NSString *imageExtensions;
    NSString *postDataType;
    NSString *postTittle;
}
@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    signUpbtn.layer.cornerRadius =4;
    signUpbtn.clipsToBounds = YES;
  imagePic.layer.cornerRadius = imagePic.frame.size.width / 2;
    imagePic.clipsToBounds = YES;
    imagePic.layer.borderWidth = 1.0f;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cameraBtnPressed:(id)sender
{
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTapped:)];
    [cameraBtn addGestureRecognizer:tapRecognizer];
}
- (void)bigButtonTapped:(UITapGestureRecognizer*)sender
{
    
    [self.view endEditing:YES];
    NSMutableArray *actionSheetItems = [@[FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@""], @"Camera"),FSActionSheetTitleWithImageItemMake(FSActionSheetTypeNormal, [UIImage imageNamed:@""], @"Photo Album"),]mutableCopy];
    FSActionSheet *actionSheet = [[FSActionSheet alloc] initWithTitle:nil cancelTitle:@"Cancel" items:actionSheetItems];
    [actionSheet showWithSelectedCompletion:^(NSInteger selectedIndex)
     {
         
         UIImagePickerController *picker = [[UIImagePickerController alloc] init];
         
         picker.navigationBar.barStyle = UIBarStyleBlack; // Or whatever style.
         picker.navigationBar.tintColor = [UIColor whiteColor];
         
         picker.delegate  = self;
         picker.allowsEditing = YES;
         switch (selectedIndex) {
             case 0:
                 
                 if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                 {
                     UIAlertView*  myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera"  delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                     [myAlertView show];
                 }
                 else
                 {
                     
                     picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                     [self presentViewController:picker animated:YES completion:Nil];
                     
                 }
                 
                 break;
             case 1:
                 
                 picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                 
                 [self presentViewController:picker animated:YES completion:NULL];
                 
             default:
                 break;
         }
         
         
     }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSString* mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ( [mediaType isEqualToString:@"public.image" ])
    {
        
        imagePath = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
        
        
        myString = imagePath.absoluteString;
        postDataType=@"IMAGE";
        postTittle=@"This is Image Post";
        NSLog(@"myString==%@",myString);
        
        NSString *imageName=[imagePath lastPathComponent];
        NSLog(@"imageName==%@",imageName);
        imageExtensions= [imageName pathExtension];
        NSLog(@"extension: %@",imageExtensions);
        //------
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        currentSelectedImage=image;
        
        currentSelectedImage = [self imageWithReduceImage:image scaleToSize:CGSizeMake(100, 100)];
        
        imageData= UIImagePNGRepresentation(currentSelectedImage);
        
        NSLog(@"Size of image = %lu KB",(imageData.length/1024));
        imagePic.image=currentSelectedImage;
        imageBtnBool =YES;
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [picker dismissViewControllerAnimated:YES completion:Nil];
    
}
-(UIImage*)imageWithReduceImage: (UIImage*)imageName scaleToSize: (CGSize)newsize
{
    UIGraphicsBeginImageContextWithOptions(newsize, NO, 12.0);
    [imageName drawInRect:CGRectMake(0, 0, newsize.width, newsize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (IBAction)signUpbtnPressed:(id)sender
{
    [self.view endEditing:YES];
    NSString *phoneNumString,*UsernameString,*EmailString,*PasswordString;
    UsernameString= [nameTxtFld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    EmailString= [emailTxtFld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    phoneNumString= [emailTxtFld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
   
  
    PasswordString= [passwordTxtFld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([[UsernameString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your username."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
    }
    else if ([[EmailString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your email."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
        
    }
    else if (![Utility NSStringIsValidEmail:emailTxtFld.text] && emailTxtFld.text.length >0 &&![[[NSUserDefaults standardUserDefaults]valueForKey:@"IPHONELANGUAGE"] isEqualToString:@"ar"])
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter a valid email."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
    }

    else if ([[phoneNumString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your first name."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
        
    }
        else if ([[PasswordString stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter your password."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
    }
//    else if (([passwordTxtFld.text  length] < 8))
//    {
//        FCAlertView *alert = [[FCAlertView alloc] init];
//        alert.bounceAnimations = YES;
//        alert.animateAlertInFromTop = YES;
//        alert.avoidCustomImageTint = YES;
//        alert.detachButtons = YES;
//        alert.blurBackground = YES;
//        
//        [alert showAlertInView:self
//                     withTitle:@"Song Book"
//                  withSubtitle:@"Password must contain minimum 8 characters"
//               withCustomImage:[UIImage imageNamed:@"AppIcon"]
//           withDoneButtonTitle:nil
//                    andButtons:nil];
//        
//        
//    }
        else
    {
        [self callRegisterApi];
    }

}
- (IBAction)signInBtnPressed:(id)sender
{
   [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL result = YES;
    if (textField == phnNumTxtFld ) {
        if (string.length != 0) {
            NSMutableString *text = [NSMutableString stringWithString:[[textField.text componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""]];
               if (text.length > 0)
            [text insertString:@"(" atIndex:0];
            
            if (text.length > 3)
                [text insertString:@")" atIndex:4];
            
            if (text.length > 7)
                [text insertString:@"-" atIndex:8];
            
            if (text.length > 11)
            {
                text = [NSMutableString stringWithString:[text substringToIndex:12]];
                result = NO;
            }
            textField.text = text;
        }
        
        return result;
        
        
        
        
        
    }
    return YES;
}


-(void)callRegisterApi
{
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
    NSMutableDictionary*dict=[[NSMutableDictionary alloc]init];
    
    [dict setValue:emailTxtFld.text forKey:@"email"];
    [dict setValue:nameTxtFld.text forKey:@"fullname"];
    [dict setValue:passwordTxtFld.text forKey:@"password"];
    [dict setValue:phnNumTxtFld.text forKey:@"phone"];
    [dict setValue:@"IOS" forKey:@"device_type"];
    [dict setValue:@"12345678" forKey:@"device_token"];
    // add params (all params are strings)profile_pic
    for (NSString *param in dict) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [dict objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    //Assuming data is not nil we add this to the multipart form
    if (imageBtnBool)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.png\"\r\n",@"profile_pic"] dataUsingEncoding:NSUTF8StringEncoding]];
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
    NSURL *url1 = [NSURL URLWithString:WebURl@"register"];
    [request setURL:url1];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
                                          if (error)
                                          {
                                              NSLog(@"%@", error);
                                          }
                                          else
                                          {
                                              [RunOnMainThread runBlockInMainQueueIfNecessary:^{
                                                  
                                                  NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                  //  NSLog(@"%@", httpResponse);
                                                  NSString *responseString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                                                  dic = [[NSDictionary alloc]init];
                                                  dic = [NSJSONSerialization JSONObjectWithData:data options:
                                                         
                                                         NSJSONReadingAllowFragments error:nil];
                                                  NSLog(@"Key values%@",dic);
                                                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                                                  
                                                  //                                                        [Utility setValue:@"1" forKey:callNotification];
                                                  NSLog(@"response> %@",[dic valueForKey:@"message"]);
                                                  NSMutableArray *dataArray;
                                                  dataArray=[[NSMutableArray alloc]init];
                                                  dataArray=[dic valueForKey:@"register_data"];
                                                  [Utility setValue:[dataArray  valueForKey:@"access_token"] forKey:access_token];
                                                  
                                                  [Utility setValue:[dataArray  valueForKey:@"user_invite_code"] forKey:user_invite_code];
                                                  [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"register_data"]forKey:@"loginData"];
                                                  [[NSUserDefaults standardUserDefaults] synchronize];
                                                  [[NSUserDefaults standardUserDefaults] setValue:@"Yes" forKey:@"LoggedIn"];
                                                  {
                                                      //                                                            SignUpShiftRequirmentViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpShiftRequirmentViewController"];
                                                      //                                                            secondView.firstnameString=firstNameTextfield.text;
                                                      //                                                            secondView.lastnameString=lastNameTextfield.text;
                                                      //                                                            [self.navigationController pushViewController:secondView animated:YES];
                                                  }
                                                  
                                                  
                                              }];
                                              
                                              
                                              
                                              NSString *status = [NSString stringWithFormat:@"nn>> %@",[dic objectForKey:@"Status"]];
                                              if ([status isEqualToString:@"ERROR"])
                                              {
                                                  
                                                  FCAlertView *alert = [[FCAlertView alloc] init];
                                                  alert.bounceAnimations = YES;
                                                  alert.animateAlertInFromTop = YES;
                                                  alert.avoidCustomImageTint = YES;
                                                  alert.detachButtons = YES;
                                                  alert.blurBackground = YES;
                                                  
                                                  [alert showAlertInView:self
                                                               withTitle:@"Shado Sport"
                                                            withSubtitle:[dict valueForKey:@"message"]
                                                         withCustomImage:[UIImage imageNamed:@"AppIcon"]
                                                     withDoneButtonTitle:nil
                                                              andButtons:nil];
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      
                                                  });
                                              }
                                              
                                              else
                                              {
                                                  
                                                  dispatch_async(dispatch_get_main_queue(), ^{
                                                      
                                                      
                                                  });
                                              }
                                              
                                          }
                                      }];
    [dataTask resume];
    
}

   //

@end
