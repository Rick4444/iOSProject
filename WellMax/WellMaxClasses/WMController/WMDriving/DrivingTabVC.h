//
//  DrivingTabVC.h
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface DrivingTabVC : UIViewController<MKMapViewDelegate, CLLocationManagerDelegate>{
    IBOutlet UIButton *btnStart;
    IBOutlet UIButton*btnDriving,*btnSetting;
}

@property(nonatomic, weak) IBOutlet MKMapView* mapView;
@property(nonatomic,retain)CLLocationManager* locationManager;


@end
