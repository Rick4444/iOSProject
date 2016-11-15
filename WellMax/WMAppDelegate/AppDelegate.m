//
//  AppDelegate.m
//  WellMax
//
//  Created by EVS on 10/9/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "AppDelegate.h"
#import "Utils.h"
#import "TabBarVC.h"
#import "Reachability.h"
#import "sharedobject.h"
#import "LogoutVC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize strTabStatus;
+ (AppDelegate *)sharedAppDelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


+ (UIStoryboard *)storyBoardType
{
    UIStoryboard *storyboard;
    
    
    if (IS_IPHONE_5_SCREEN)
    {
        storyboard = [UIStoryboard storyboardWithName:@"Main_i5" bundle:nil];
        
        
        
        
        NSLog(@"loaded iPhone5 Storyboard");
    }
    else if (IS_IPHONE_4_SCREEN)
    {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        NSLog(@"loaded iPhone4 Storyboard");
    }
    else if (IS_IPHONE_6_SCREEN)
    {
        storyboard = [UIStoryboard storyboardWithName:@"Main_i6" bundle:nil];
        
        NSLog(@"loaded Main_iPhone6 Storyboard");
    }
    else if (IS_IPAD_iPad_SCREEN){
        NSLog(@"loaded Main_ipad Storyboard");
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    }
    else if (IS_IPHONE_6Plus_SCREEN)
    {
        storyboard = [UIStoryboard storyboardWithName:@"Main_i6P" bundle:nil];
        
        NSLog(@"loaded Main_iPhone6P Storyboard");
        
        
    }
    
    return storyboard;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }forState:UIControlStateSelected];
    
    strTabStatus=@"0";
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleLightContent];
   
//    UIStoryboard *storyboard = [AppDelegate storyBoardType];
//    
//    UIViewController *viewController =[storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
//    
//    UINavigationController *navController = [[UINavigationController alloc] init];
//    [navController pushViewController:viewController animated:YES];
//    self.window.rootViewController = navController;
//    [self.window makeKeyAndVisible];
//    [self startReachability];
    
    [self login];
    return YES;
}

-(void)startReachability{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReachability= [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus=[self.hostReachability currentReachabilityStatus];
    sharedobject *sh=[sharedobject sharedmanager];
    
    switch (internetStatus) {
            
        case NotReachable:
            sh.networkFlag=FALSE;
            break;
            
        case ReachableViaWiFi:
            sh.networkFlag=TRUE;
            
        case ReachableViaWWAN:
            sh.networkFlag=TRUE;
            
        default:
            break;
    }
    
    self.internetReachability=[Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
    
}


-(void)reachabilityChanged:(NSNotification*)note{
    
    sharedobject *sh=[sharedobject sharedmanager];
    Reachability *reachability=[note object];
    NSParameterAssert([reachability isKindOfClass:[Reachability class]]);
    NetworkStatus internetStatus =[reachability currentReachabilityStatus];
    
    switch (internetStatus) {
            
        case NotReachable:
            sh.networkFlag=FALSE;
            break;
        case ReachableViaWiFi:
            sh.networkFlag=TRUE;
            break;
        case ReachableViaWWAN:
            sh.networkFlag=TRUE;
            break;
            
        default:
            break;
    }
    
}

-(void)login{
    
    UIStoryboard*storyboard=[AppDelegate storyBoardType];
    TabBarVC*tabbarvc=(TabBarVC*)[storyboard instantiateViewControllerWithIdentifier:@"TabBarVCId"];
  //  UINavigationController *navController = [[UINavigationController alloc] init];
  //  [navController pushViewController:tabbarvc animated:YES];
    self.window.rootViewController = tabbarvc;
    [self.window makeKeyAndVisible];
    [self startReachability];
    
}
-(void)logout{
    
    UIStoryboard *storyboard = [AppDelegate storyBoardType];
    
    UIViewController *viewController =[storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
    
    UINavigationController *navController = [[UINavigationController alloc] init];
    [navController pushViewController:viewController animated:YES];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
}

@end
