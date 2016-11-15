//
//  AppDelegate.h
//  WellMax
//
//  Created by EVS on 10/9/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

{
    NSString *strTabStatus;
}
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic,strong)NSString *strTabStatus;
+ (AppDelegate *)sharedAppDelegate;
+ (UIStoryboard *)storyBoardType;

-(void)logout;
@property (nonatomic, retain) Reachability *hostReachability;
@property (nonatomic, retain) Reachability *internetReachability;
@property (nonatomic, retain) Reachability *wifiReachability;
@property(nonatomic,strong)UITabBarController*tabBarVcc;



@end

