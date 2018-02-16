//
//  ApiMaster.m
//
//  Created by Eshan cheema on 11/3/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import "ApiMaster.h"
//#import "UIAlertView+Blocks.h"


typedef void (^APICompletionHandler)(NSDictionary* responseDict,NSError *error);


@implementation ApiMaster


static ApiMaster* singleton = nil;

+(ApiMaster*)singleton
{
    if(singleton == nil)
        singleton = [[self alloc] init];
    return singleton;
}
-(id)init
{
    if(self = [super init])
    {
    }
    return self;
}






# pragma mark - Register user API
-(void)signUpUserWithInfo:(NSMutableDictionary*)userInfo
        completionHandler:(APICompletionHandler)handler
{
  //  email, fullname, password, phone, device_type, device_token, profile_pic
    
    NSString* infoStr = [NSString stringWithFormat:@"email=%@&fullname=%@&password=%@&phone=%@&device_type=%@&device_token=%@&profile_pic=%@"
                
                         ,userInfo [@"email"],userInfo[@"password"],userInfo [@"password"],userInfo[@"phone"],userInfo [@"device_type"],userInfo[@"device_token"],userInfo[@"profile_pic"]];
   
    McomLOG(@"infostr :%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@register",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is the url -->%@",url);
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] ];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setTimeoutInterval:540];
    
    NSLog(@" request at sign up%@",request);
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}












# pragma mark - Login user API
-(void)signInUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    NSString* infoStr = [NSString stringWithFormat:@"email=%@&password=%@&device_type=%@&device_token=%@",userInfo[@"email"], userInfo[@"password"] ,userInfo [@"device_type"],userInfo [@"device_token"]];
    
    NSLog(@"infoStr AT LOGIN %@",infoStr);
    
        NSString *url=[[NSString stringWithFormat:@"%@login",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"that is URL -->%@",url);
    
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"REQUEST AT LOGIN %@",request);
    
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}

# pragma mark - Forgot Password API

-(void)ForgotPasswrodWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
   
    
    NSString* infoStr = [NSString stringWithFormat:@"email=%@&Device_type=%@",userInfo[@"email"],userInfo[@"Device_type"]];
        NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@forgot_password",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At Frogot %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}


# pragma mark - my profile API

-(void)myprofile:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
   
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@profile_data",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
}












-(void)myProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
     NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
        NSLog(@"%@",infoStr);
     NSString *url=[[NSString stringWithFormat:@"%@profile_data",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
     NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}


-(void)UpdateProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&fullname=%@&email=%@&phone=%@&location=%@&profile_pic=%@",userInfo[@"access_token"],userInfo[@"fullname"],userInfo[@"email"],userInfo[@"phone"],userInfo[@"location"],userInfo[@"profile_pic"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@update_profile",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];

    
}

-(void)ChangePasswordWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler
{
    
    
    
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@&old_password=%@&password=%@",userInfo[@"access_token"],userInfo[@"old_password"],userInfo[@"password"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@change_password",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
    
}



-(void)LogoutWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler

{
    NSString* infoStr = [NSString stringWithFormat:@"access_token=%@",userInfo[@"access_token"]];
    NSLog(@"%@",infoStr);
    NSString *url=[[NSString stringWithFormat:@"%@logout",WebURl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest* request =[NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPBody:[infoStr dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"Request At profile %@",request);
    [request setTimeoutInterval:540];
    [self forwardRequest1:request showActivity:YES completionHandler:handler];
    
}






























#pragma mark request to Server
-(void)forwardRequest:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity

    completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}

#pragma mark request1 to Server

-(void)forwardRequest1:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity
    completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
   
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             
//             [Appdelegate stopLoader:nil];
             
              return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}




#pragma mark request1 to Server
-(void)forwardGetServive:(NSMutableURLRequest*)request showActivity:(BOOL)showActivity
     completionHandler:(APICompletionHandler)handler
{
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:
     ^(NSURLResponse* response, NSData* data, NSError* connectionError)
     {
         if(connectionError != nil)
         {
             [[[UIAlertView alloc] initWithTitle:@"Connection Error !" message:@"No Internet Connection" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
             return;
         }
         McomLOG(@"Response String %@", NSStringFromNSData(data));
         if(handler != nil)
             handler(JSONObjectFromData(data),connectionError);
     }];
}

@end
