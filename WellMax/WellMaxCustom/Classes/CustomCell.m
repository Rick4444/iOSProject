//
//  CustomCell.m
//  SampleCode
//
//  Created by Apple on 10/5/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "CustomCell.h"
#import "Utils.h"
@implementation CustomCell
@synthesize lbl300,lblDate,lblDistance,lblTime;
- (void)awakeFromNib {
    // Initialization code



                  lblDistance.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
                  lblDistance.textColor=[UIColor colorWithRed:120.0/259.0 green:120.0/259.0 blue:120.0/259.0 alpha:1];

                  lblTime.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
                  lblTime.textColor=[UIColor colorWithRed:120.0/259.0 green:120.0/259.0 blue:120.0/259.0 alpha:1];

                  lblDate.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
                  lblDate.textColor=[UIColor colorWithRed:120.0/259.0 green:120.0/259.0 blue:120.0/259.0 alpha:1];


                  lbl300.font=[UIFont fontWithName:@"Montserrat-Regular" size:15];
                  lbl300.textColor=[UIColor colorWithRed:27.0/259.0 green:78.0/259.0 blue:154.0/259.0 alpha:1];

         

         self.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];
         }

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
