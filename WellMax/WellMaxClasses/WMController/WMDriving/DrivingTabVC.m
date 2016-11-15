//
//  DrivingTabVC.m
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "DrivingTabVC.h"
#import "DrivingSettingsVC.h"
#import "AppDelegate.h"
#import "Utils.h"
#import "WMDataManager.h"
#import "WMUser.h"
#import <SVProgressHUD.h>
#import "MyAnnotation.h"
#import <CoreLocation/CoreLocation.h>
#import <AddressBook/AddressBook.h>

@interface DrivingTabVC ()
{
         AppDelegate *appDelegate;
         WMUser *user;
         CLLocation* _currentLocaton;
         CLLocationManager* _cLLocationManager;
         CLLocationCoordinate2D *currentLocation;
}
@end

@implementation DrivingTabVC

- (void)viewDidLoad {
    [super viewDidLoad];

         appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
         appDelegate.strTabStatus=@"2";


         if (IS_IPHONE_5_SCREEN)
         {
                  UIView *addStatusBar = [[UIView alloc] init];
                  addStatusBar.frame = CGRectMake(0, 0, 320, 20);

                  addStatusBar.backgroundColor = [UIColor blackColor];
                  [self.view addSubview:addStatusBar];

         }else if (IS_IPHONE_6_SCREEN){
                  UIView *addStatusBar = [[UIView alloc] init];
                  addStatusBar.frame = CGRectMake(0, 0, 375, 20);

                  addStatusBar.backgroundColor = [UIColor blackColor];
                  [self.view addSubview:addStatusBar];


         }else if (IS_IPHONE_6Plus_SCREEN){
                  UIView *addStatusBar = [[UIView alloc] init];
                  addStatusBar.frame = CGRectMake(0, 0, 414, 20);

                  addStatusBar.backgroundColor = [UIColor blackColor];
                  [self.view addSubview:addStatusBar];

         }else{
                  UIView *addStatusBar = [[UIView alloc] init];
                  addStatusBar.frame = CGRectMake(0, 0, 320, 20);

                  addStatusBar.backgroundColor = [UIColor blackColor];
                  [self.view addSubview:addStatusBar];
                  
                  
         }
         




         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];

         self.navigationController.navigationBarHidden=YES;


         [btnStart setTitle:@"Start" forState:UIControlStateNormal];
         [btnStart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [btnStart setBackgroundColor:[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1]];
         btnStart.layer.cornerRadius=4;
         btnStart.clipsToBounds=YES;
    [btnStart addTarget:self action:@selector(startRide:) forControlEvents:UIControlEventTouchUpInside];

    
//driving button
         [btnDriving setTitle:@"DRIVING" forState:UIControlStateNormal];
         [btnDriving setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         btnDriving.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];

//setting button
         [btnSetting addTarget:self action:@selector(settingButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self showMap];

}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
   user=[_rAppdata userObject];
    
    if (user.id) {
        if ([Utils checkNetworkConnection]) {
            
            [SVProgressHUD showWithStatus:@"Refreshing data.." maskType:SVProgressHUDMaskTypeBlack];
            
            [Utils loginBtnClicked:^(NSMutableDictionary *responseDictionary) {
                
                [SVProgressHUD dismiss];
                
                 NSError *error;
                
                WMUser* user_detail = [[WMUser alloc] initWithDictionary:[responseDictionary objectForKey:@"User"] error:&error];
                
                [user_detail setuserData:[responseDictionary objectForKey:@"User"]];
                
                
            } email:user.emailId password:user.password2];
    
        }
        else{
            
            [Utils getAlert:InternetMessage view:self];
        }
        
    }
    else{
        
        [self movetoLoginPage];
    }
    
    
}




-(void)settingButtonClick{
         UIStoryboard*storyboard=[AppDelegate storyBoardType ];
         DrivingSettingsVC*dsvc=(DrivingSettingsVC*)[storyboard instantiateViewControllerWithIdentifier:@"DrivingSettingsVCId"];
         [self.navigationController pushViewController:dsvc animated:YES];
         dsvc=nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)movetoLoginPage{
    
    appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate  logout];
    
    
}


-(IBAction)startRide:(id)sender{
    
//    CLLocation *currentLoc = /* Assume you have found it */;
//    CLLocation *restaurnatLoc = [[CLLocation alloc] initWithLatitude:restaurnatLat longitude:restaurnatLng];
//    CLLocationDistance meters = [restaurnatLoc distanceFromLocation:currentLoc];
//    // Go ahead with this
}


-(void)showMap{
    
    
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.distanceFilter = kCLDistanceFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
     _currentLocaton = [[CLLocation alloc]init];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self.locationManager requestWhenInUseAuthorization];
    
    [_locationManager startUpdatingLocation];

    
    MKCoordinateSpan span;
    span.latitudeDelta = 0.9;
    span.longitudeDelta= 0.9;

    
    DLog(@"Staring Point latitude : %f", _locationManager.location.coordinate.latitude);
    DLog(@"Staring Point longitude: %f", _locationManager.location.coordinate.longitude);
        
    
    
    MKCoordinateRegion newRegion =
    MKCoordinateRegionMakeWithDistance(_locationManager.location.coordinate, 200, 200);
   
    
    CLGeocoder *fgeo = [[CLGeocoder alloc] init];
    
    // Reverse Geocode a CLLocation to a CLPlacemark
    [fgeo reverseGeocodeLocation:_currentLocaton
               completionHandler:^(NSArray *placemarks, NSError *error){
                   
                   // Make sure the geocoder did not produce an error
                   // before continuing
                   if(!error){
                       // Iterate through all of the placemarks returned
                       // and output them to the console
                       for(CLPlacemark *placemark in placemarks){
                           
                          // DLog(@"%@",[placemark description]);
                           NSDictionary *dictAddress = placemarks[0];
                           
                           NSString *addressString = [dictAddress objectForKey:(NSString *)kABPersonAddressCityKey];
                           NSLog(@"Address: %@", addressString);
                
                       }
                   }
                   else{
                
                       DLog(@"There was a reverse geocoding error\n%@",
                             [error localizedDescription]);
                   }
               }
         ];
    
    NSString *titleStr =@"Starting Point";
    
    MyAnnotation *addAnnotation = [[MyAnnotation alloc] initWithCoordinate:_locationManager.location.coordinate title:titleStr];
        
        [_mapView addAnnotation:addAnnotation];
        [_mapView setRegion:newRegion animated:YES];
    
    [self zoomAndFit];
}

- (void)updateMapZoomLocation:(CLLocation *)newLocation
{
    MKCoordinateRegion region;
    region.center.latitude = newLocation.coordinate.latitude;
    region.center.longitude = newLocation.coordinate.longitude;
    region.span.latitudeDelta = 0.1;
    region.span.longitudeDelta = 0.1;
    [_mapView setRegion:region animated:YES];
}

- (void) zoomAndFit{
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in _mapView.annotations)
    {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
        
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    
    // Add a little extra space on the sides
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 2;
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 2;
    region = [_mapView regionThatFits:region];
    
    if (region.center.latitude != -180 && region.center.longitude != -180) {
        [_mapView setRegion:region animated:NO];
    }
}


- (void) setRegionForMapToDisplayAnnotation:(CLLocationCoordinate2D)coords mapview:(MKMapView *)map{
    
    MKCoordinateSpan span = {.latitudeDelta =  0.1, .longitudeDelta =  0.1};
    MKCoordinateRegion region = {coords, span};
    [map setRegion:region animated:false];
    
}

#pragma mark - CLLocationManagerDelegate

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [_cLLocationManager stopUpdatingLocation];
    // [self showMap:_mapView];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
    
    
    
    _currentLocaton = newLocation; //[[CLLocation alloc] initWithLatitude:41.891224 longitude:-87.631073];//newLocation;
    [_cLLocationManager stopUpdatingLocation];
    
    if (_currentLocaton != nil)
    {
        
        // [self showMap:_mapView];
        //[self showMap];
    }
    
    _cLLocationManager.delegate = nil;
    _cLLocationManager = nil;
}

#pragma mark -- Map

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if (annotation == mapView.userLocation)
        return nil;
    
    static NSString *s = @"ann";
    MKAnnotationView *pin = [mapView dequeueReusableAnnotationViewWithIdentifier:s];
    if (!pin)
    {
        pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:s];
        pin.canShowCallout = YES;
        pin.calloutOffset = CGPointMake(0, 0);
    }
    return pin;
}

- (void) mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    // all the annotations fit in the map view
    MKMapRect zoomRect = MKMapRectNull;
    for (id <MKAnnotation> annotation in mapView.annotations)
    {
        MKMapPoint annotationPoint = MKMapPointForCoordinate(annotation.coordinate);
        MKMapRect pointRect = MKMapRectMake(annotationPoint.x, annotationPoint.y, 0.1, 0.1);
        if (MKMapRectIsNull(zoomRect))
        {
            zoomRect = pointRect;
        } else
        {
            zoomRect = MKMapRectUnion(zoomRect, pointRect);
        }
    }
}


@end
