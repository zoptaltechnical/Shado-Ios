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


-(void)addPostWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)updatePostWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)myHomeListingWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)myHomeDetailLikeWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)getReportWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)sendReportReasonsWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)getTeamWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;
-(void)getCampaignListingWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

-(void)getNotificationWithInfo:(NSMutableDictionary*)userInfo completionHandler:(APICompletionHandler)handler;

@end
