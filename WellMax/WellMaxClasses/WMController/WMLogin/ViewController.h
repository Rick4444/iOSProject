//
//  ViewController.h
//  SampleCode
//
//  Created by EVS on 9/29/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{


         IBOutlet UITextField*txtEmail,*txtPassword;
         IBOutlet UILabel *lblLogin,*lblWell,*lblMax,*lblApps;
         IBOutlet UIScrollView*scrollView;


}
@property (nonatomic, retain) NSDictionary *dict_contactDetail;
@property (weak,nonatomic)IBOutlet UIButton* btnSignIn,*btnForgotPassword,*btnDntHaveAnAccount,*btnSignUp;

-(IBAction)forgotPassword:(id)sender;


@end

