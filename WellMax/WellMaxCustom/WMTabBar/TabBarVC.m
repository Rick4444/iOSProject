//
//  TabBarVC.m
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "TabBarVC.h"

@interface TabBarVC ()

@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];






        

//******************************* TAB BAR BACKGROUND COLOR CHANGE *************

         
         [[UITabBar appearance] setBarTintColor:[UIColor blackColor]];


         
//TAB BAR IMAGE COLOR
         self.tabBar.tintColor=[UIColor colorWithRed:64.0/259.0 green:132.0/259.0 blue:250.0/259.0 alpha:1];

//******************************************************************************













//******************************** STATUS BAR BACKGROUND COLOR *****************



         UIView *addStatusBar = [[UIView alloc] init];
         addStatusBar.frame = CGRectMake(0, 0, 320, 20);

         addStatusBar.backgroundColor = [UIColor blackColor];
         [self.view addSubview:addStatusBar];




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
