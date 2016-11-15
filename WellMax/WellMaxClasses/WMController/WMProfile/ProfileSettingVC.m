//
//  ProfileSettingVC.m
//  SampleCode
//
//  Created by Apple on 10/1/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "ProfileSettingVC.h"
#import "Utils.h"
@interface ProfileSettingVC ()

@end

@implementation ProfileSettingVC

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







         
//***************** VIEW BACKGROUND COLOR **************************************


         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];


//******************************************************************************






    // Do any additional setup after loading the view.
}

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
