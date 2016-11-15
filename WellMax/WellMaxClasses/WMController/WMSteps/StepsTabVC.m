//
//  StepsTabVC.m
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "StepsTabVC.h"
#import "AppDelegate.h"
#import "Utils.h"
@interface StepsTabVC ()
{
         AppDelegate *appDelegate;
}
@end

@implementation StepsTabVC

- (void)viewDidLoad {
    [super viewDidLoad];

         appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
         appDelegate.strTabStatus=@"1";




//***************** VIEW BACKGROUND COLOR **************************************


         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];


//******************************************************************************














         


//***************** FOUR BUTTONS and THEIR LABELs *****************************



//btnOne , lblOne;

         [btnOne setTitle:@"19" forState:UIControlStateNormal];
         [btnOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [btnOne setBackgroundColor:[UIColor colorWithRed:237.0/259.0 green:237.0/259.0 blue:237.0/259.0 alpha:1]];
         btnOne.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:30];
         btnOne.titleEdgeInsets=UIEdgeInsetsMake(-35, 0, 0, 0);
         btnOne.layer.cornerRadius=4;
         btnOne.clipsToBounds=YES;


         lblOne.text=@"Steps";
         lblOne.textColor=[UIColor blackColor];
         lblOne.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];



//btnTwo ,lblTwo

         [btnTwo setTitle:@"0.05" forState:UIControlStateNormal];
         [btnTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [btnTwo setBackgroundColor:[UIColor colorWithRed:237.0/259.0 green:237.0/259.0 blue:237.0/259.0 alpha:1]];
         btnTwo.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:30];
         btnTwo.titleEdgeInsets=UIEdgeInsetsMake(-35, 0, 0, 0);
         btnTwo.layer.cornerRadius=4;
         btnTwo.clipsToBounds=YES;


         lblTwo.text=@"Kms";
         lblTwo.textColor=[UIColor blackColor];
         lblTwo.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];


//btnThree , lblThree

         [btnThree setTitle:@"10" forState:UIControlStateNormal];
         [btnThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [btnThree setBackgroundColor:[UIColor colorWithRed:237.0/259.0 green:237.0/259.0 blue:237.0/259.0 alpha:1]];
         btnThree.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:30];
         btnThree.titleEdgeInsets=UIEdgeInsetsMake(-35, 0, 0, 0);
         btnThree.layer.cornerRadius=4;
         btnThree.clipsToBounds=YES;


         lblThree.text=@"Steps";
         lblThree.textColor=[UIColor blackColor];
         lblThree.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];



//btnFour , lblFour



         [btnFour setTitle:@"4" forState:UIControlStateNormal];
         [btnFour setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [btnFour setBackgroundColor:[UIColor colorWithRed:237.0/259.0 green:237.0/259.0 blue:237.0/259.0 alpha:1]];
         btnFour.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:30];
         btnFour.titleEdgeInsets=UIEdgeInsetsMake(-35, 0, 0, 0);
         btnFour.layer.cornerRadius=4;
         btnFour.clipsToBounds=YES;


         lblFour.text=@"Km/hr";
         lblFour.textColor=[UIColor blackColor];
         lblFour.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];









//***************** STATUS BAR BACKGROUND COLOR ********************************



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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
