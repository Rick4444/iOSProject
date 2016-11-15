//
//  Utils.m
//  i-Recruiting
//
//  Created by EVS on 9/2/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import "Utils.h"
#import <UIKit/UIKit.h>
#import "sharedobject.h"
#import "Reachability.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "TabBarVC.h"
#import "WMUser.h"
#import "WMDataManager.h"


@implementation Utils

+ (void)getAlert:(NSString*)message view:(id)view{
    
    UIAlertView* dialog = [[UIAlertView alloc] initWithTitle:@"" message:message delegate:view cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [dialog show];
}


+(void)setViewMovedUp:(BOOL)movedUp view:(UIView*)view{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    CGRect rect = view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD+0;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        rect.origin.y += kOFFSET_FOR_KEYBOARD+0  ;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    view.frame = rect;
    
    [UIView commitAnimations];
    
}


+ (BOOL) checkNetworkConnection{
    
    sharedobject *sh=[sharedobject sharedmanager];
    if (sh.networkFlag==FALSE)
    {
        return NO;
    }
    return YES;
}


+(void)loginBtnClicked:(void (^)(NSMutableDictionary *responseDictionary))callback email:(NSString*)email password:(NSString*)password{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"emailId": email, @"password": password};
    NSString *strURL=BaseURL;
    strURL=[strURL stringByAppendingString:validateLogin];
    
    [manager POST:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSMutableDictionary *responseDictionary=responseObject;
        DLog(@"%@", [responseDictionary objectForKey:@"User"]);
        
        if ([[responseDictionary objectForKey:@"0"] isEqualToString:@"2"]==TRUE) {
            [SVProgressHUD showWithStatus:@"Account Authenticated"];
            
            callback(responseDictionary);
            
        }
        else if ([[responseDictionary objectForKey:@"0"] isEqualToString:@"1"]==TRUE) {
            [SVProgressHUD dismiss];
            [Utils getAlert:@"Your Account is unpublished by the administrator." view:self];
            
        }else if ([[responseDictionary objectForKey:@"0"] isEqualToString:@"0"]==TRUE) {
            
            [SVProgressHUD dismiss];
            [Utils getAlert:AccountUnAuthenticated view:self];
        }
        else{
            
            [SVProgressHUD dismiss];
            [Utils getAlert:InternalError view:self];
        }
        
        
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              DLog(@"ERROR: %@", error);
              [SVProgressHUD dismiss];
              [SVProgressHUD showErrorWithStatus:InternalError];
              
          }];
    
}



@end
