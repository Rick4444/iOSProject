//
//  MyAnnotation.h
//  GovSummit
//
//  Created by Rameshwar Gupta on 19/01/15.
//  Copyright (c) 2015 Rameshwar Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface MyAnnotation : NSObject<MKAnnotation>

{
    
    CLLocationCoordinate2D coordinate;
    
    NSString *title;
    
    NSString *subTitle;
    
    NSString *time;
    
}

@property (nonatomic)CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *title;

@property (nonatomic, retain) NSString *subTitle;

@property (nonatomic,retain) NSString *time;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *) t subTitle:(NSString *)timed time:(NSString *)tim;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c title:(NSString *)tit;

@end
