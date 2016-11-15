//
//  ViewController.m
//  SampleCode
//
//  Created by EVS on 9/29/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "ViewController.h"
#import "ObjectClass.h"
#import "AppDelegate.h"
#import "RegistrationVC.h"
#import "utils.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "TabBarVC.h"
#import "WMUser.h"
#import "WMDataManager.h"




#define kOFFSET_FOR_KEYBOARD 80.0
@interface ViewController (){

         NSMutableArray *arrFinalApplicantList;
         
}


@end

@implementation ViewController

@synthesize btnDntHaveAnAccount,btnSignIn,btnSignUp,btnForgotPassword,dict_contactDetail;

- (void)viewDidLoad
{
    [super viewDidLoad];
         txtEmail.returnKeyType = UIReturnKeyDone;
         txtPassword.returnKeyType = UIReturnKeyDone;
//    lbl_name.text = [NSString stringWithFormat:@"%@ %@", [dict_contactDetail  valueForKey:@"fname"], [dict_contactDetail  valueForKey:@"lname"]];

//         NSArray *fontFamilyNames = [UIFont familyNames];
//
//         for (NSString *familyName in fontFamilyNames)
//         {
//                  // font names under family
//                  for(NSString *fontName in [UIFont fontNamesForFamilyName:familyName])
//                  {
//                           NSLog(@"Font Name = %@", fontName);
//                  }
//         }



//*********** PLACEHOLDER COLOR CHANGE ****************************************



        UIColor *color = [UIColor whiteColor];
         txtEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Username" attributes:@{NSForegroundColorAttributeName: color}];
          txtEmail.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];

         UIColor*COLOR=[UIColor whiteColor];
         txtPassword.attributedPlaceholder=[[NSAttributedString alloc]initWithString:@"  Passsword" attributes:@{NSForegroundColorAttributeName:COLOR}];
         txtPassword.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];



//******************************************************************************







//******************************** STATUS BAR BACKGROUND COLOR *****************



         UIView *addStatusBar = [[UIView alloc] init];
         addStatusBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);

         addStatusBar.backgroundColor = [UIColor blackColor];
         [self.view addSubview:addStatusBar];



//******************************************************************************






//******************************** HIDE NAVIGATION **************************

         self.navigationController.navigationBarHidden=YES;

//*****************************************************************************




         

//***************************** LABELs ***********************************



//LOGIN LABEL
         if (IS_IPAD_iPad_SCREEN) {
                  lblLogin.text=@"LOGIN";
                  lblLogin.textColor=[UIColor whiteColor];
                  lblLogin.backgroundColor=[UIColor clearColor];
                  lblLogin.font=[UIFont fontWithName:@"Montserrat-Regular" size:31];
         }else{
         lblLogin.text=@"LOGIN";
         lblLogin.textColor=[UIColor whiteColor];
         lblLogin.backgroundColor=[UIColor clearColor];
         lblLogin.font=[UIFont fontWithName:@"Montserrat-Regular" size:20];
         }



//WELL LABEL

         if (IS_IPAD_iPad_SCREEN) {
                  lblWell.text=@"well";
                  lblWell.textColor=[UIColor whiteColor];
                  lblWell.backgroundColor=[UIColor clearColor];
                  lblWell.font=[UIFont fontWithName:@"Montserrat-Regular" size:29];
         }else{
         lblWell.text=@"well";
         lblWell.textColor=[UIColor whiteColor];
         lblWell.backgroundColor=[UIColor clearColor];
}

//MAX LABEL

                  if (IS_IPAD_iPad_SCREEN) {
                           lblMax.text=@"max";
                          lblMax.textColor=[UIColor colorWithRed:48.0/259.0 green:203.0/259.0 blue:247.0/259.0 alpha:1];
                           lblMax.backgroundColor=[UIColor clearColor];
                           lblMax.font=[UIFont fontWithName:@"Montserrat-Regular" size:29];
                  }else{
         lblMax.text=@"max";
         lblMax.textColor=[UIColor colorWithRed:48.0/259.0 green:203.0/259.0 blue:247.0/259.0 alpha:1];
         lblMax.backgroundColor=[UIColor clearColor];
}

//APPS LABEL

                           if (IS_IPAD_iPad_SCREEN) {
                                    lblApps.text=@"apps";
                                    lblApps.textColor=[UIColor whiteColor];
                                    lblApps.backgroundColor=[UIColor clearColor];
                                    lblApps.font=[UIFont fontWithName:@"Montserrat-Regular" size:29];
                           }else{
         lblApps.text=@"apps";
         lblApps.textColor=[UIColor whiteColor];
         lblApps.backgroundColor=[UIColor clearColor];
                           }

//*****************************************************************************





         
//********************** HIDE KEYBOARD ****************************************





//touch anywhere on screen to hide keyboard
         
         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(dismissKeyboard)];

         [self.view addGestureRecognizer:tap];




//*****************************************************************************











//***************** VIEW BACKGROUND COLOR **************************************




         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];




//******************************************************************************










//************************ SIGN IN BUTTON ***********************************




//BUTTON CORNER SHAPE
         btnSignIn.layer.cornerRadius=4;
         btnSignIn.clipsToBounds=YES;


//BUTTON TEXT

         if (IS_IPAD_iPad_SCREEN) {

                  [btnSignIn setTitle:@"SIGN IN" forState:UIControlStateNormal];

                  [btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

                  btnSignIn.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:27];

         }

         else

         {

         [btnSignIn setTitle:@"SIGN IN" forState:UIControlStateNormal];

         [btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnSignIn.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];

         }

//BUTTON BACKGROUND COLOR
         btnSignIn.backgroundColor=[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1];




//******************************************************************************










//************************ FORGOT PASSWORD BUTTON ******************************



        // UIFont *customFont = [UIFont fontWithName:@"Montserrat-Bold_0" size:1];

         if (IS_IPAD_iPad_SCREEN) {
                  [btnForgotPassword setTitle:@"Forgot Password?" forState:UIControlStateNormal];

                  [btnForgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

                  btnForgotPassword.layer.cornerRadius=4;

                  btnForgotPassword.clipsToBounds=YES;

                  btnForgotPassword.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:19];

         }else{
         [btnForgotPassword setTitle:@"Forgot Password?" forState:UIControlStateNormal];

         [btnForgotPassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnForgotPassword.layer.cornerRadius=4;

         btnForgotPassword.clipsToBounds=YES;

         btnForgotPassword.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];

         }


//******************************************************************************








//************************ SIGNUP BUTTON ***************************************


         if (IS_IPAD_iPad_SCREEN)

         {

                  [btnSignUp setTitle:@"SIGN UP" forState:UIControlStateNormal];

                  [btnSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

                  btnSignUp.backgroundColor=[UIColor clearColor];

                  btnSignUp.layer.cornerRadius=4;

                  btnSignUp.clipsToBounds=YES;

                  btnSignUp.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:27];

         }

         else

         {

         [btnSignUp setTitle:@"SIGN UP" forState:UIControlStateNormal];

         [btnSignUp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnSignUp.backgroundColor=[UIColor clearColor];

         btnSignUp.layer.cornerRadius=4;

         btnSignUp.clipsToBounds=YES;

         btnSignUp.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];

         }
         

//********************************************************************************************











//************************ DONT HAVE AN ACCOUNT BUTTON ************************


         if (IS_IPAD_iPad_SCREEN)

         {

                  [btnDntHaveAnAccount setTitle:@"Don't have an Account?" forState:UIControlStateNormal];

                  [btnDntHaveAnAccount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

                  btnDntHaveAnAccount.backgroundColor=[UIColor clearColor];

                  btnDntHaveAnAccount.layer.cornerRadius=4;

                  btnDntHaveAnAccount.clipsToBounds=YES;

                  btnDntHaveAnAccount.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:17];

         }

         else

         {

         [btnDntHaveAnAccount setTitle:@"Don't have an Account?" forState:UIControlStateNormal];

         [btnDntHaveAnAccount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnDntHaveAnAccount.backgroundColor=[UIColor clearColor];

         btnDntHaveAnAccount.layer.cornerRadius=4;

         btnDntHaveAnAccount.clipsToBounds=YES;

         btnDntHaveAnAccount.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];

         }


//******************************************************************************
    /*

     ObjectClass *objGroup = [[ObjectClass alloc]init];
     objGroup.code = @"";
     objGroup.image = @"";
     objGroup.manft = @"";
     objGroup.brand = @"";
     objGroup.product = @"";
     objGroup.size = @"";
     objGroup.comment = @"";
     objGroup.address = @"";
     objGroup.lat = @"";
     objGroup.longt = @"";
     objGroup.status = @"";
     objGroup.date = @"";
    
     [db insertRecord:objGroup];
     
     */
          arrFinalApplicantList=[[NSMutableArray alloc]initWithCapacity:0];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









//****************************** DISMISS KEYBOARD*****************************



-(void)dismissKeyboard {//(void method) touch anywhere on screen to hide keyboard

         [txtEmail resignFirstResponder];
         [txtPassword resignFirstResponder];
         
}

-(IBAction)HideKeyboardClick:(id)sender{
         [txtPassword resignFirstResponder];
         [txtEmail resignFirstResponder];
}

-(IBAction)forgotPassword:(id)sender
{

    DLog(@"forgot password hit");
    
    
}


-(IBAction)SigninClick:(id)sender{
    
    
     txtPassword.text=@"654321";
     txtEmail.text=@"rameshwar@evirtualservices.com";
    
    if ([txtEmail.text isEqualToString:@""]==TRUE) {
        
        [Utils getAlert:@"Email Id can not be empty." view:self];
    }
    else if (![self validateEmailWithString:txtEmail.text]){
        [Utils getAlert:@"Please enter a valid email." view:self];
    }
    
    else if ([txtPassword.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Password can not be empty." view:self];
    }
    
    else
        if([Utils checkNetworkConnection]){
            
            [SVProgressHUD showWithStatus:@"Acccount Authenticating.." maskType:SVProgressHUDMaskTypeBlack];
            
            [Utils loginBtnClicked:^(NSMutableDictionary *responseDictionary) {
                
                
                [SVProgressHUD dismiss];
                
                NSError *error;
                
                WMUser* user_detail = [[WMUser alloc] initWithDictionary:[responseDictionary objectForKey:@"User"] error:&error];
                
                [user_detail setuserData:[responseDictionary objectForKey:@"User"]];
                
                if (user_detail.id) {
                    
                    [self loginSuccessfull];
                }
                
                
            } email:txtEmail.text password:txtPassword.text];
            
        }
    
        else{
            [Utils getAlert:InternetMessage view:self];
        }
}


/*
-(void)loginBtnClicked{
    
    [SVProgressHUD showWithStatus:@"Authenticating.." maskType:SVProgressHUDMaskTypeBlack];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *parameters = @{@"emailId": txtEmail.text, @"password": txtPassword.text};
    NSString *strURL=BaseURL;
    strURL=[strURL stringByAppendingString:validateLogin];
    
    [manager POST:strURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject){
        
        NSDictionary *dict=responseObject;
        DLog(@"%@", [dict objectForKey:@"User"]);
        
        if ([[dict objectForKey:@"0"] isEqualToString:@"2"]==TRUE) {
            [SVProgressHUD showWithStatus:@"Account Authenticated"];
            [self saveDataAfterAccountAuthenticated:dict];
            
        }
        else if ([[dict objectForKey:@"0"] isEqualToString:@"1"]==TRUE) {
            [SVProgressHUD dismiss];
            [Utils getAlert:@"Your Account is unpublished by the administrator." view:self];
            
        }else if ([[dict objectForKey:@"0"] isEqualToString:@"0"]==TRUE) {
            
            [SVProgressHUD dismiss];
            [Utils getAlert:AccountUnAuthenticated view:self];
        }
        else{
            
            [SVProgressHUD dismiss];
            [Utils getAlert:InternalError view:self];
        }
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              DLog(@"ERROR: %@", error);
              [SVProgressHUD dismiss];
              [SVProgressHUD showErrorWithStatus:InternalError];
              
          }];
    
}

*/
-(void)saveDataAfterAccountAuthenticated:(NSDictionary*)dict{
    
    
    NSError *error;
    
    WMUser* user_detail = [[WMUser alloc] initWithDictionary:[dict objectForKey:@"User"] error:&error];
    
    [user_detail setuserData:[dict objectForKey:@"User"]];
    
    NSUserDefaults *defJobList=[NSUserDefaults standardUserDefaults];
    
    NSArray *arrJobListing=[dict objectForKey:@"Job_list"];
    
    if (![arrJobListing isEqual:[NSNull null]]) {
        
        [defJobList setObject:arrJobListing forKey:@"jobList"];
        [defJobList synchronize];
        
        
        for (int i=0; i<arrJobListing.count; i++) {
            
            NSDictionary *dict=[arrJobListing objectAtIndex:i];
            NSArray *arr=[dict objectForKey:@"Applicent_List"];
            if (arr.count>0) {
                for (int k=0; k<arr.count; k++) {
                    
                    [arrFinalApplicantList addObject:[arr objectAtIndex:k]];
                    
                }
            }
        }
        
    }
    
    if (user_detail.id) {
        
        [self loginSuccessfull];
        
    }
    
}

-(void)loginSuccessfull{
    
     [SVProgressHUD dismiss];
         UIStoryboard*storyboard=[AppDelegate storyBoardType];
         TabBarVC*tabbarvc=(TabBarVC*)[storyboard instantiateViewControllerWithIdentifier:@"TabBarVCId"];
         [self.navigationController pushViewController:tabbarvc animated:YES];
         tabbarvc=nil;
}

- (BOOL)validateEmailWithString:(NSString*)checkString
{
         BOOL stricterFilter = NO;
         NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
         NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
         NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
         NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
         return [emailTest evaluateWithObject:checkString];
}

-(IBAction)SignUp:(id)sender{
    
        UIStoryboard*storyboard=[AppDelegate storyBoardType];
        RegistrationVC*registration=(RegistrationVC*)[storyboard instantiateViewControllerWithIdentifier:@"RegistrationVCId"];
        [self.navigationController pushViewController:registration animated:YES];
        registration=nil;

}



-(void)addEmergencyContact:(id)sender
{
         scrollView.frame = CGRectMake(0, 0, 320, 460);
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
         if([textField isEqual:txtEmail])
         {
                  [scrollView setContentOffset:CGPointMake(0, 70)];
                  scrollView.frame = CGRectMake(0, 0, 320, 210);
         }
         if([textField isEqual:txtPassword])
         {
                  [scrollView setContentOffset:CGPointMake(0, 140)];
                  scrollView.frame = CGRectMake(0, 0, 320, 210);
         }
         }

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
         scrollView.frame = CGRectMake(0, 0, 320, 460);
         [textField resignFirstResponder];
         return YES;
}
@end
