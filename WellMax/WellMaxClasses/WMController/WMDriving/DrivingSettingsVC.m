//
//  DrivingSettingsVC.m
//  SampleCode
//
//  Created by Apple on 10/1/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "DrivingSettingsVC.h"
#import "Utils.h"

@interface DrivingSettingsVC ()

@end

@implementation DrivingSettingsVC
@synthesize vwToDisplayColor,segControlForColor;

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





//******************* TABLE VIEW LABELs ***************************************


//lblDistance


//lblDate


//lblTime


         
//lbl300KM
         






//*****************************************************************************
         tbleView.backgroundColor=[UIColor clearColor];


//***************** SEGMENT CONTROL **************************************


if (segmentcontrol.selectedSegmentIndex==0) {
                  segmentcontrol.backgroundColor=[UIColor blueColor];
         }

//******************************************************************************






         

//***************** VIEW BACKGROUND COLOR **************************************


         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];


//******************************************************************************











//********************* STATUS BAR LABELs *************************************


         
//lblDrivingHistory
         lblDrivingHistory.text=@"DRIVING HISTORY";
         lblDrivingHistory.textColor=[UIColor whiteColor];
         lblDrivingHistory.backgroundColor=[UIColor clearColor];
         lblDrivingHistory.font=[UIFont fontWithName:@"Montserrat-Regular" size:20];

//lblBackground
         lblBackGround.backgroundColor=[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1];



//******************************************************************************


         
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





//********************** SEGMENT CONTROL ACTION ********************************



- (IBAction)segColorBtnTapped:(id)sender {
         segmentcontrol.backgroundColor=[UIColor whiteColor];
         segmentcontrol.layer.cornerRadius=4;
         segmentcontrol.clipsToBounds=YES;

         if (segmentcontrol.selectedSegmentIndex==0){
                  segmentcontrol.backgroundColor=[UIColor blueColor];
         }else if(segmentcontrol.selectedSegmentIndex==1){
                  segmentcontrol.backgroundColor=[UIColor blueColor];
         }else{
                  segmentcontrol.backgroundColor=[UIColor blueColor];
         }
      }




//******************************************************************************





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
         // Return the number of sections.
         return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

         return 65;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
         // Return the number of rows in the section.
         return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
         UIView *invisibleView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds .size.width, 15)];
         [invisibleView setBackgroundColor:[UIColor clearColor]];
         return invisibleView;
         
}
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
         static NSString *CellIdentifier = @"Cell";
         [tableView setBackgroundColor:[UIColor clearColor]];

         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
         if (cell == nil) {
                  cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                  [cell.contentView setAlpha:0];
                  [cell setUserInteractionEnabled:NO];
                [tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
                  cell =[tableView dequeueReusableCellWithIdentifier:CellIdentifier];


                  
                  }
         return cell;


 }

@end
