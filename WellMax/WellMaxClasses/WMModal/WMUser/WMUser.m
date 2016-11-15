//
//  WMUser.m
//  WellMax
//
//  Created by EVS on 10/13/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "WMUser.h"
#import "Utils.h"



@implementation WMUser


-(id)init{
    
    if (self==[super init]) {
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        
        _id                     =       [defaults objectForKey:UserId];
        _name                  =       [defaults objectForKey:UserFullName];
        _username                  =       [defaults objectForKey:UserName];
        _emailId                =       [defaults objectForKey:UserEmailId];
        _password2              =       [defaults objectForKey:UserPassword];
        _city                =       [defaults objectForKey:UserCity];
        _country                 =       [defaults objectForKey:UserCountry];
        _zip_code                  =       [defaults objectForKey:UserZipCode];
        _emp_status             =       [defaults objectForKey:UserEmpStatus];
        _pay_range                =       [defaults objectForKey:UserPayRange];
        _mobile           =       [defaults objectForKey:UserMobile];
        _phone                 =       [defaults objectForKey:UserPhone];
        
        _sex             =       [defaults objectForKey:UserGender];
        _dob                =       [defaults objectForKey:UserDOB];
        _wight           =       [defaults objectForKey:UserWeight];
        _bGroup                 =       [defaults objectForKey:UserBloodGroup];
    
        [defaults synchronize];
        
        
    }
    return self;
    
}



-(void)setuserData:(NSDictionary *)dict{
    
    
    _id                     =       [dict objectForKey:UserId];
    _name                  =       [dict objectForKey:UserFullName];
    _username                  =       [dict objectForKey:UserName];
    _emailId                =       [dict objectForKey:UserEmailId];
    _password2              =       [dict objectForKey:UserPassword];
    _city                =       [dict objectForKey:UserCity];
    _country                 =       [dict objectForKey:UserCountry];
    _zip_code                  =       [dict objectForKey:UserZipCode];
    _emp_status             =       [dict objectForKey:UserEmpStatus];
    _pay_range                =       [dict objectForKey:UserPayRange];
    _mobile           =       [dict objectForKey:UserMobile];
    _phone                 =       [dict objectForKey:UserPhone];
    
    _sex             =       [dict objectForKey:UserGender];
    _dob                =       [dict objectForKey:UserDOB];
    _wight           =       [dict objectForKey:UserWeight];
    _bGroup                 =       [dict objectForKey:UserBloodGroup];
    
    DLog(@"user first name is:-%@",_name);
    [self savePreferences];
    
}


-(void)savePreferences{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.id                     forKey:UserId];
    [defaults setObject:self.name                  forKey:UserFullName];
    [defaults setObject:self.username                  forKey:UserName];
    [defaults setObject:self.emailId                forKey:UserEmailId];
    [defaults setObject:self.password2              forKey:UserPassword];
    [defaults setObject:self.city                forKey:UserCity];
    [defaults setObject:self.zip_code                 forKey:UserZipCode];
    [defaults setObject:self.country                  forKey:UserCity];
    [defaults setObject:self.mobile             forKey:UserMobile];
    [defaults setObject:self.phone                forKey:UserPhone];
    [defaults setObject:self.emp_status           forKey:UserEmpStatus];
    [defaults setObject:self.pay_range           forKey:UserPayRange];
    
    [defaults setObject:self.sex             forKey:UserGender];
    [defaults setObject:self.dob                forKey:UserDOB];
    [defaults setObject:self.bGroup           forKey:UserBloodGroup];
    [defaults setObject:self.wight           forKey:UserWeight];
    
    
    [defaults synchronize];
    
}



// destroy the preferences of user

-(void)destroyPreferences{
    
    self.id=nil;
    self.name=nil;
    self.username=nil;
    self.emailId=nil;
    self.password2=nil;
    self.city=nil;
    self.country=nil;
    self.zip_code=nil;
    self.emp_status=nil;
    self.pay_range=nil;
    self.mobile=nil;
    self.phone=nil;
    
    self.sex=nil;
    self.dob=nil;
    self.bGroup=nil;
    self.wight=nil;
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults removeObjectForKey:UserId];
    [defaults removeObjectForKey:UserName];
    [defaults removeObjectForKey:UserFullName];
    [defaults removeObjectForKey:UserEmpStatus];
    [defaults removeObjectForKey:UserPayRange];
    [defaults removeObjectForKey:UserCountry];
    [defaults removeObjectForKey:UserCity];
    [defaults removeObjectForKey:UserZipCode];
    [defaults removeObjectForKey:UserPhone];
    [defaults removeObjectForKey:UserMobile];
    [defaults removeObjectForKey:UserEmailId];
    [defaults removeObjectForKey:UserPassword];
    
    [defaults removeObjectForKey:UserGender];
    [defaults removeObjectForKey:UserWeight];
    [defaults removeObjectForKey:UserBloodGroup];
    [defaults removeObjectForKey:UserDOB];
    
    [defaults synchronize];
    
    
}



@end
