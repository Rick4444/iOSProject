//
//  sharedobject.m
//  Midzy
//
//  Created by Rameshwar Gupta on 14/02/15.
//  Copyright (c) 2015 RameshwarGupta. All rights reserved.
//

#import "sharedobject.h"

@implementation sharedobject
@synthesize networkFlag;

+(sharedobject *)sharedmanager{
    
    static sharedobject* singleton=nil;
    if (singleton) {
        return singleton;
    }
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        singleton=[[self alloc]init];
        singleton.networkFlag=FALSE;
    });
    
    return singleton;
}

@end
