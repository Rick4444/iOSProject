//
//  LogoutVC.m
//  SampleCode
//
//  Created by Apple on 10/1/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "LogoutVC.h"
#import "ProfileVC.h"
#import "AppDelegate.h"
#import "StepsTabVC.h"
#import "DrivingTabVC.h"
#import "ProfileVC.h"
#import "ViewController.h"
#import "Utils.h"
#import "WMUser.h"
#import "WMDataManager.h"

@interface LogoutVC (){
         UIAlertView*alert;
         
                  AppDelegate *appDelegate;

}

@end

@implementation LogoutVC

- (void)viewDidLoad {
    [super viewDidLoad];



//******************************** STATUS BAR BACKGROUND COLOR *****************

         

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
         
//******************************************************************************



}
-(void)viewWillAppear:(BOOL)animated{
         alert=[[UIAlertView alloc]initWithTitle:@"Warning" message:@"Are you sure you want to Logout?" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:@"No", nil];
         [alert show];
    // Do any additional setup after loading the view.
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
         if (buttonIndex==0) {

//LOGOUT
             WMUser *user= [_rAppdata userObject];
             [user destroyPreferences];
    
             appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
                  [appDelegate  logout];

                  }else{
                  [self.parentViewController.tabBarController setSelectedIndex:0];

                  }}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
