//
//  RegistrationVC.h
//  SampleCode
//
//  Created by Apple on 9/29/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RegistrationVC : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource, UITextFieldDelegate>
{
         IBOutlet UIButton *btnSignIn,*btnSignUp,*btnYouHaveAnAccount;

          IBOutlet UITextField *txtSelectCity,*txtFullName,*txtCity,*txtZipcoDE,*txtCellPhoneNumber,*txtCellPhoneProvider,*txtEmail,*txtCurrentEmployment,*txtCurrentPayRange, *txtPassword, *txtUsername;

         IBOutlet UIScrollView*scrollVieww;

         IBOutlet UILabel *lblRegisterNow;
}

@property(weak,nonatomic)IBOutlet UIBarButtonItem *barButton;
@property(nonatomic, retain) IBOutlet UIPickerView *pickerView;

@end
