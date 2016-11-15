//
//  MyAnnotation.m
//  GovSummit
//
//  Created by Rameshwar Gupta on 19/01/15.
//  Copyright (c) 2015 Rameshwar Gupta. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate;

@synthesize title;

@synthesize time;

@synthesize subTitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim

{
    
    self.coordinate=c;
    
    self.time=tim;
    
    self.subTitle=timed;
    
    self.title=t;
    
    return self;
    
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit

{
    
    self.coordinate=c;
    
    self.title=tit;
    
    return self;
    
}



@end
