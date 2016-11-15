//
//  Utils.h
//  i-Recruiting
//
//  Created by EVS on 9/2/15.
//  Copyright (c) 2015 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//Device
#define IS_IPAD_iPad_SCREEN [[UIScreen mainScreen] bounds].size.height == 1024.0f
#define IS_IPHONE_6Plus_SCREEN [[UIScreen mainScreen] bounds].size.height == 736.0f
#define IS_IPHONE_6_SCREEN [[UIScreen mainScreen] bounds].size.height == 667.0f
#define IS_IPHONE_5_SCREEN [[UIScreen mainScreen] bounds].size.height == 568.0f
#define IS_IPHONE_4_SCREEN [[UIScreen mainScreen] bounds].size.height >= 480.0f && [[UIScreen mainScreen] bounds].size.height < 568.0f

//============================================================

#define DocumentPath ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])

#define LIB_DIR_PATH    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0]

#define VideoPath ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])



#define NavigationBackgroundColor [UIColor colorWithRed:0.23f green:0.33f blue:0.42f alpha:1.0]

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)

#endif

#define kOFFSET_FOR_KEYBOARD  80.0


#define KVersion [[[UIDevice currentDevice] systemVersion] intValue]

#define kSCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define kSCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define placeHolderImage            @"img_holder_Venue"

#define _rAppdata  [WMDataManager sharedObject]

// Color Code

#define NavigationBackgroundColor [UIColor colorWithRed:0.23f green:0.33f blue:0.42f alpha:1.0]
#define greenAttemptColor [UIColor colorWithRed:0.0f green:0.63f blue:0.52f alpha:0.8]
#define redAttemptColor [UIColor colorWithRed:0.88f green:0.20f blue:0.16f alpha:0.8]

// Default Messages..

#define InternalError               @"There is an error.Please try again."
#define InternetMessage             @"Internet connection is not available. Please check your wifi setting or cellular data."
#define SlowInternet                @"Your internet connection is very slow.PLease tr again later."
#define EmailExisted                @"Email Id/Username does not exist."
#define AccountUnAuthenticated      @"Please enter valid e-mail and password"


//All URLs
#define BaseURL                @"http://sitedemo.evirtualservices.com/wellmaxapps/site/webservices/"

#define ImageURL                @""
#define resumeDownloadURL       @""
#define videoDownloadURL        @""

// Validate methods

#define validateLogin                   @"login"

//Company Data

#define UserId                                   @"id"
#define UserName                                 @"username"
#define UserFullName                                 @"name"
#define UserEmailId                              @"emailId"
#define UserPassword                             @"password2"
#define UserCity                              @"city"
#define UserCountry                               @"country"
#define UserZipCode                                 @"zip_code"
#define UserEmpStatus                           @"emp_status"
#define UserPayRange                              @"pay_range"
#define UserMobile                        @"mobile"
#define UserPhone                          @"phone"

#define UserGender                           @"sex"
#define UserDOB                              @"dob"
#define UserWeight                        @"wight"
#define UserBloodGroup                          @"bGroup"




@interface Utils : NSObject

+ (void)getAlert:(NSString*)message view:(id)view;
+(void)setViewMovedUp:(BOOL)movedUp view:(UIView*)view;
+ (BOOL) checkNetworkConnection;

//+(void)loginBtnClicked:(NSString*)email password:(NSString*)password;
+(void)loginBtnClicked:(void (^)(NSMutableDictionary *responseDictionary))callback email:(NSString*)email password:(NSString*)password;
@end
