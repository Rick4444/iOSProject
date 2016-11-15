//
//  WMUser.h
//  WellMax
//
//  Created by EVS on 10/13/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel.h>


@protocol WMUser <NSObject>
@end

@interface WMUser : JSONModel

@property(nonatomic, strong) NSString *id;
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *emailId;

@property(nonatomic, strong) NSString *password2;
@property(nonatomic, strong) NSString *city;
@property(nonatomic, strong) NSString *country;
@property(nonatomic, strong) NSString *zip_code;

@property(nonatomic, strong) NSString *emp_status;
@property(nonatomic, strong) NSString *pay_range;
@property(nonatomic, strong) NSString *mobile;
@property(nonatomic, strong) NSString *phone;

@property(nonatomic, strong) NSString *sex;
@property(nonatomic, strong) NSString *dob;
@property(nonatomic, strong) NSString *wight;
@property(nonatomic, strong) NSString *bGroup;



//save user preferences for automatic login

-(void)savePreferences;

// method to set user data;

-(void)setuserData:(NSDictionary *)dict;

// Destroy the data of current user

-(void) destroyPreferences;



@end
