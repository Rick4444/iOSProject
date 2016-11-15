//
//  sharedobject.h
//  Midzy
//
//  Created by Rameshwar Gupta on 14/02/15.
//  Copyright (c) 2015 RameshwarGupta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface sharedobject : NSObject

@property(nonatomic, assign)BOOL networkFlag;
+ (sharedobject *)sharedmanager;

@end
