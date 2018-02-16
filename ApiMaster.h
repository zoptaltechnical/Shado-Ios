//
//  ApiMaster.h
//  
//
//  Created by Eshan cheema on 11/3/14.
//  Copyright (c) 2014 Eshan cheema. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utility.h"
#import "Constants.h"

typedef void (^APICompletionHandler)(NSDictionary* responseDict,NSError *error);

@interface ApiMaster : NSObject


+(ApiMaster*)singleton;



-(void)myProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)UpdateProfileWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)ChangePasswordWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)signUpUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)signInUserWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;


-(void)ForgotPasswrodWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;





-(void)LogoutWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;









@end
