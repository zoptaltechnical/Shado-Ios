//
//  ProfileViewController.m
//  shado
//
//  Created by Eshan cheema on 1/31/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
{
    NSMutableArray *myProfileArray;
    NSString *emailString,*editString;
    NSURL *imagePath;
    NSString *myString;
    NSString *imageExtensions;
    NSString *postDataType;
    NSString *postTittle;
    NSData* imageData;
    BOOL imageBtnBool ;
    UIImage *currentSelectedImage;
    NSDictionary  *dic;
}

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    saveBtn.layer.cornerRadius=15.0f;
    saveBtn.clipsToBounds=YES;
    [self DisableFields];
    myProfileArray=[[NSMutableArray alloc]init];
    [self callMyProfileAPi];
    profilePic.layer.cornerRadius = profilePic.frame.size.width / 2;
    profilePic.clipsToBounds = YES;
    [saveBtn setHidden:YES];
    profilePic.layer.borderWidth = 1.0f;
     [editBtn setTitle:@"Edit" forState:UIControlStateNormal];
       [editBtn setImage:[UIImage imageNamed:@"ic_edit"] forState:UIControlStateNormal];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] init];
    [tapRecognizer addTarget:self action:@selector(bigButtonTappedNew:)];
    [profilePic addGestureRecognizer:tapRecognizer];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}
- (IBAction)backButtonPressed:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)editBtnPressed:(id)sender
{
    
    [saveBtn setHidden:NO];
        [self enableFields];
       [editBtn setTitle:@"SAVE" forState:UIControlStateNormal];
  
    
        
    
}
- (IBAction)saveBtn:(id)sender
{
    
    [saveBtn setHidden:YES];
    [self DisableFields];
    
    [self callValidations];
}

-(void)enableFields
{
    [profileBtn setHidden:NO];
    profilePic.userInteractionEnabled=YES;
    fullNameTextfield.userInteractionEnabled=YES;
    emailtextfield.userInteractionEnabled=YES;
    phoneNumTextfield.userInteractionEnabled=YES;
    locationTextfield.userInteractionEnabled=YES;
    addresstextfield.userInteractionEnabled=YES;
    
     editBtn.hidden=YES;
    [saveBtn setHidden:NO];
    [self.view endEditing:YES];

 
    
    
    
    
}
-(void)DisableFields
{
    [saveBtn setHidden:YES];
    [self.view endEditing:YES];
    [profileBtn setHidden:YES];
    fullNameTextfield.userInteractionEnabled=NO;
    phoneNumTextfield.userInteractionEnabled=NO;
    emailtextfield.userInteractionEnabled=NO;
    locationTextfield.userInteractionEnabled=NO;
    addresstextfield.userInteractionEnabled=NO;
    profilePic.userInteractionEnabled=NO;
    editBtn.hidden=NO;
    
  
    
}
-(void)callValidations
{
    [self.view endEditing:YES];
    if ([[fullNameTextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        
        //messageLabel.text=@"Please enter full name.";
        
        FCAlertView *alert = [[FCAlertView alloc] init];
                alert.bounceAnimations = YES;
                alert.animateAlertInFromTop = YES;
                alert.avoidCustomImageTint = YES;
                alert.detachButtons = YES;
                alert.blurBackground = YES;
        
                [alert showAlertInView:self
                             withTitle:@"Shado Sport"
                          withSubtitle:@"Please enter fullname."
                       withCustomImage:[UIImage imageNamed:@"AppIcon"]
                   withDoneButtonTitle:nil
                            andButtons:nil];

    }
  //    else if ([[addresstextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
//    {
//        FCAlertView *alert = [[FCAlertView alloc] init];
//        alert.bounceAnimations = YES;
//        alert.animateAlertInFromTop = YES;
//        alert.avoidCustomImageTint = YES;
//        alert.detachButtons = YES;
//        alert.blurBackground = YES;
//        
//        [alert showAlertInView:self
//                     withTitle:@"Shado Sport"
//                  withSubtitle:@"Please enter manager Surname."
//               withCustomImage:[UIImage imageNamed:@"AppIcon"]
//           withDoneButtonTitle:nil
//                    andButtons:nil];
//
//        [backgroundView setHidden:NO];
//        messageLabel.text=@"Please enter manager Surname.";
//        
//        [self enableFields];
//        
//        
//    }
    
    else if ([[emailtextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
                alert.bounceAnimations = YES;
                alert.animateAlertInFromTop = YES;
                alert.avoidCustomImageTint = YES;
                alert.detachButtons = YES;
                alert.blurBackground = YES;
        
                [alert showAlertInView:self
                             withTitle:@"Shado Sport"
                          withSubtitle:@"Please enter email."
                       withCustomImage:[UIImage imageNamed:@"AppIcon"]
                   withDoneButtonTitle:nil
                            andButtons:nil];

        
    }
    else if (![Utility NSStringIsValidEmail:emailtextfield.text] && emailtextfield.text.length >0 &&![[[NSUserDefaults standardUserDefaults]valueForKey:@"IPHONELANGUAGE"] isEqualToString:@"ar"])
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter valid email."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];

        
       
    }
    else if ([[phoneNumTextfield.text stringByReplacingOccurrencesOfString:@" " withString:@""] length] == 0)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter phone number."
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        
     

        
        
        
        
    }
    

    else  if ([[phoneNumTextfield.text stringByReplacingOccurrencesOfString:@"+" withString:@"+"] length] < 8)
    {
        FCAlertView *alert = [[FCAlertView alloc] init];
        alert.bounceAnimations = YES;
        alert.animateAlertInFromTop = YES;
        alert.avoidCustomImageTint = YES;
        alert.detachButtons = YES;
        alert.blurBackground = YES;
        
        [alert showAlertInView:self
                     withTitle:@"Shado Sport"
                  withSubtitle:@"Please enter a valid phone number"
               withCustomImage:[UIImage imageNamed:@"AppIcon"]
           withDoneButtonTitle:nil
                    andButtons:nil];
        

    }
   
    else
    {
        [self callUpdateProfileApi];
        [self.view endEditing:YES];
       
    }
}

- (IBAction)changePasswordBtn:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"profile" bundle:[NSBundle mainBundle]];
    changePasswordViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"changePasswordViewController"];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

}

#pragma mark
#pragma mark My profile Api
#pragma mark
-(void)callMyProfileAPi
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    NSDictionary* MyProfileInfo = @{
                                    @"access_token":[Utility valueForKey:access_token],
                                    };
    
    McomLOG(@"%@",MyProfileInfo);
    [API myProfileWithInfo:[MyProfileInfo mutableCopy] completionHandler:^(NSDictionary *responseDict,NSError *error)
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
                    withCustomImage:[UIImage imageNamed:@"AppIcon"]
                withDoneButtonTitle:nil
                         andButtons:nil];

            
         }
         
         
         else if ([dict_response[@"code"] isEqualToString:@"200"])
         {
             
             
             myProfileArray = [responseDict valueForKey:@"profile_data"] ;
             
             
             
             if ([[responseDict[@"profile_data"]   valueForKey:@"fullname"]length]>0)
             {
                 
                 fullNameTextfield.text=[responseDict[@"profile_data"]  valueForKey:@"fullname"];
                 
             }
             else
             {
                 fullNameTextfield.text=@"";
                 
                 
             }
             if ([[responseDict[@"profile_data"]   valueForKey:@"location"]length]>0)
             {
                 
                 locationTextfield.text=[responseDict[@"profile_data"]  valueForKey:@"location"];
                 
             }
             else
             {
                 locationTextfield.text=@"";
                 
                 
             }
             
             if ([[responseDict[@"profile_data"] valueForKey:@"profile_pic"]length]>0)
             {
                 [profilePic sd_setImageWithURL:[NSURL URLWithString:[responseDict[@"profile_data"] valueForKey:@"profile_pic"]]placeholderImage:[UIImage imageNamed:@"pro"] options:SDWebImageRefreshCached];
                 
             }
             else
             {
                 profilePic.image=[UIImage imageNamed:@"pro"];
                 
             }

             if ([[responseDict[@"profile_data"]  valueForKey:@"email"]length]>0)
             {
                emailString=[responseDict[@"profile_data"]  valueForKey:@"email"];

                 emailtextfield.text=emailString;
                 
             }
             else
             {
                 emailtextfield.text=@"";
                 
                 
             }
             if (  emailString.length>18)
                                 {
                 
                 
                                     CGSize maximumLabelSize = CGSizeMake(300, 30);
                 
                                     CGSize expectedLabelSize = [ emailString sizeWithFont: emailtextfield.font constrainedToSize:maximumLabelSize lineBreakMode:NSLineBreakByWordWrapping];
                 
                                     emailtextfield.text=emailString;
                                     CGRect newFrame =  emailtextfield.frame;
                                     newFrame.size.height = expectedLabelSize.height;
                                     emailHgtConst.constant=newFrame.size.height;
                                 }
                                 else
                                 {
                                     
                                     emailHgtConst.constant=30;
                                     emailString= emailtextfield.text;
                                     
                                 }


              if ([[responseDict[@"profile_data"]   valueForKey:@"phone"]length]>0)
             {
                 phoneNumTextfield.text=[responseDict[@"profile_data"]  valueForKey:@"phone"];
                 
             }
             else
             {
                 phoneNumTextfield.text=@"0";
             }
             [Utility setValue:@"1" forKey:callNotification];
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
- (void)bigButtonTappedNew:(UITapGestureRecognizer*)sender
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
        profilePic.image=currentSelectedImage;
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
#pragma mark
#pragma mark Call Update profile Api
#pragma mark

-(void)callUpdateProfileApi
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
    [dict setValue:[Utility valueForKey:access_token] forKey:@"access_token"];
    [dict setValue:fullNameTextfield.text forKey:@"fullname"];
    [dict setValue:emailtextfield.text forKey:@"email"];
    [dict setValue:phoneNumTextfield.text forKey:@"phone"];
    [dict setValue:locationTextfield.text forKey:@"location"];
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
    NSURL *url1 = [NSURL URLWithString:WebURl@"update_profile"];
    [request setURL:url1];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                        FCAlertView *alert = [[FCAlertView alloc] init];
                                                        alert.bounceAnimations = YES;
                                                        alert.animateAlertInFromTop = YES;
                                                        alert.avoidCustomImageTint = YES;
                                                        alert.detachButtons = YES;
                                                        alert.blurBackground = YES;
                                                        
                                                        [alert showAlertInView:self
                                                                     withTitle:@"Shado Sport"
                                                                  withSubtitle:@"Profile updated successfully."
                                                               withCustomImage:[UIImage imageNamed:@"AppIcon"]
                                                           withDoneButtonTitle:nil
                                                                    andButtons:nil];

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
                                                            [editBtn setHidden:NO];
                                                            [saveBtn setHidden:YES];
                                                            [self DisableFields];
                                                            [self callMyProfileAPi];
                                                            [Utility setValue:@"1" forKey:callNotification];
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

#pragma mark
#pragma mark TextField delegate
#pragma mark
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"1");
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"2");
    [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"3");
    if (textField == fullNameTextfield)
    {
        [emailtextfield becomeFirstResponder];
    }
//    else if (textField == addresstextfield)
//    {
//        [emailtextfield becomeFirstResponder];
//    }
    else if (textField == emailtextfield)
    {
        [phoneNumTextfield becomeFirstResponder];
    }
    else if (textField == phoneNumTextfield)
    {
        [locationTextfield becomeFirstResponder];
    }
    else if (textField == locationTextfield)
    {
        [locationTextfield resignFirstResponder];
    }
      [textField resignFirstResponder];
    return YES;
}


@end
