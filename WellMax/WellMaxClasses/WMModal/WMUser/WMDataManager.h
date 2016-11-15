//
//  WMDataManager.h
//  WellMax
//
//  Created by EVS on 10/13/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMUser.h"

@interface WMDataManager : NSObject{
    
    WMUser *_user;
}

+(WMDataManager*) sharedObject;

// Code to create singleton object for Wellmax

-(WMUser*)userObject;


@end
