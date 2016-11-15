//
//  DrivingSettingsVC.h
//  SampleCode
//
//  Created by Apple on 10/1/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrivingSettingsVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
         IBOutlet UILabel *lblBackGround,*lblDrivingHistory;

          UILabel *lblDistance,*lbl300KM,*lblDate,*lblTime;

         IBOutlet UISegmentedControl*segmentcontrol;

         IBOutlet UITableView*tbleView;

         IBOutlet UITableViewCell*tableViewCell;

         IBOutlet UIImageView*imgTableView;

}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segControlForColor;
@property (weak, nonatomic) IBOutlet UIView *vwToDisplayColor;
- (IBAction)segColorBtnTapped:(id)sender;
@end
