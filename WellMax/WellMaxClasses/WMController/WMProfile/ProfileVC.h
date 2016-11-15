//
//  ProfileVC.h
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileVC : UIViewController<UITextFieldDelegate>
{
         IBOutlet UITextField*txtAndreOliveria,*txtYahoo,*txtPhoneNumber,*txtWeight,*txtBloodGroup,*txtFemale,*txtDOB;

         IBOutlet UIButton*btnUpdate;

         IBOutlet UILabel *lblProfile,*lblBackground;
}
@end
