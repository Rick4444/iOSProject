//
//  WMDataManager.m
//  WellMax
//
//  Created by EVS on 10/13/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "WMDataManager.h"
#import "WMUser.h"


static WMDataManager *gDataMgr= nil;

@implementation WMDataManager

+(WMDataManager*) sharedObject{
    
    if (!gDataMgr) {
        gDataMgr=[[WMDataManager alloc]init];
    }
    return gDataMgr;
}

#pragma mark -- Code to create the object of an object class

-(WMUser*) userObject{
    
    if (_user.id==nil) {
        _user=nil;
    }
    if (_user==Nil) {
        _user=[[WMUser alloc]init];
    }
    
    return _user;
}



@end
