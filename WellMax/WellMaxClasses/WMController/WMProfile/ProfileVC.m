//
//  ProfileVC.m
//  SampleCode
//
//  Created by Apple on 9/30/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "ProfileVC.h"
#import "AppDelegate.h"
#import "ProfileSettingVC.h"
#import "Utils.h"
#import "WMDataManager.h"
#import "WMUser.h"
#import <SVProgressHUD.h>


@interface ProfileVC ()
{
    AppDelegate *appDelegate;
    BOOL chkUpdate;
}
@end

@implementation ProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];

         appDelegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
         appDelegate.strTabStatus=@"3";

    WMUser *user = [_rAppdata userObject];
    
    chkUpdate = NO;

         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(dismissKeyboard)];

         [self.view addGestureRecognizer:tap];


         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];


         lblBackground.backgroundColor=[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1];



         lblProfile.text=@"PROFILE";
         lblProfile.textColor=[UIColor whiteColor];
         lblProfile.backgroundColor=[UIColor clearColor];
         lblProfile.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];



         [btnUpdate setTitle:@"UPDATE" forState:UIControlStateNormal];
         [btnUpdate setBackgroundColor:[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1]];
         [btnUpdate setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         btnUpdate.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:15];

         btnUpdate.layer.cornerRadius=4;
         btnUpdate.clipsToBounds=YES;
    [btnUpdate addTarget:self action:@selector(updateProfile:) forControlEvents:UIControlEventTouchUpInside];


         UIColor *color = [UIColor whiteColor];
    
         txtAndreOliveria.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   AndreOliveria" attributes:@{NSForegroundColorAttributeName: color}];
         txtAndreOliveria.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];

        txtAndreOliveria.text = user.name;
        txtAndreOliveria.textColor = color;
        txtAndreOliveria.delegate = self;
    
         txtBloodGroup.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   B+" attributes:@{NSForegroundColorAttributeName: color}];
         txtBloodGroup.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
        txtBloodGroup.text = user.bGroup;
        txtBloodGroup.textColor = color;
    txtBloodGroup.delegate = self;
    
         txtDOB.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   D.O.B" attributes:@{NSForegroundColorAttributeName: color}];
         txtDOB.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
        txtDOB.text = user.dob;
        txtDOB.textColor = color;
    txtDOB.delegate = self;

         txtPhoneNumber.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   +41-4235-67891" attributes:@{NSForegroundColorAttributeName: color}];
         txtPhoneNumber.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
    txtPhoneNumber.text = user.phone;
    txtPhoneNumber.textColor = color;
    txtPhoneNumber.delegate = self;
    
         txtWeight.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   55KG" attributes:@{NSForegroundColorAttributeName: color}];
         txtWeight.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
        txtWeight.text = user.wight;
    txtWeight.textColor = color;
    txtWeight.delegate = self;

         txtYahoo.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   iCoader@gmail.com" attributes:@{NSForegroundColorAttributeName: color}];
         txtYahoo.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
        txtYahoo.text = user.emailId;
        txtYahoo.textColor = color;
        txtYahoo.delegate = self;
    

         txtFemale.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Female" attributes:@{NSForegroundColorAttributeName: color}];
         txtFemale.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
        txtFemale.text = user.sex;
        txtFemale.textColor = color;
        txtFemale.delegate = self;

         self.navigationController.navigationBarHidden=YES;


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
         

}


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    chkUpdate = NO;
    
}

-(void)dismissKeyboard {

         [txtAndreOliveria resignFirstResponder];
         [txtBloodGroup resignFirstResponder];
         [txtDOB resignFirstResponder];
         [txtFemale resignFirstResponder];
         [txtPhoneNumber resignFirstResponder];
         [txtWeight resignFirstResponder];
         [txtYahoo resignFirstResponder];
         
         
}

-(IBAction)HideKeyboardClick:(id)sender{
    
         [txtAndreOliveria resignFirstResponder];
         [txtBloodGroup resignFirstResponder];
         [txtDOB resignFirstResponder];
         [txtFemale resignFirstResponder];
         [txtPhoneNumber resignFirstResponder];
         [txtWeight resignFirstResponder];
         [txtYahoo resignFirstResponder];
}


-(IBAction)ProfileSettingsClick:(id)sender{
         UIStoryboard*storyboard=[AppDelegate storyBoardType];
         ProfileSettingVC*profileSettingVc=(ProfileSettingVC*)[storyboard instantiateViewControllerWithIdentifier:@"ProfileSettingVCId"];
         [self.navigationController pushViewController:profileSettingVc animated:YES];
         profileSettingVc=nil;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)updateProfile:(id)sender{
    
    if (chkUpdate == YES) {
        
        if([Utils checkNetworkConnection]){
            
            [SVProgressHUD showWithStatus:@"Updating Profile.." maskType:SVProgressHUDMaskTypeBlack];
            
            [self performSelector:@selector(hitUpdateProfle) withObject:self afterDelay:5.0 ];
        }
        else{
            [Utils getAlert:InternetMessage view:self];
        }
        
        
    }
    else{
        
        [Utils getAlert:@"Nothing is changed!!" view:self];
    }
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    chkUpdate = YES;
    return YES;
    
}

-(void)hitUpdateProfle{
    
     DLog(@"profile updated");
    
    
    WMUser *user =[_rAppdata userObject];
    NSDictionary *_params =
    @{
      @"name"       : txtAndreOliveria.text,
      @"emailId"    : txtYahoo.text,
      @"phone"      : txtPhoneNumber.text,
      @"dob"        : txtDOB.text,
      @"sex"        : txtFemale.text,
      @"bGroup"     : txtBloodGroup.text,
      @"wight"      : txtWeight.text,
      @"userId"     : user.id
      };
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSURL* requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@editprofile", BaseURL]];
    
    
    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    for (NSString *param in _params)
    {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    // set URL
    [request setURL:requestURL];
    
    NSURLResponse *response = nil;
    NSError *requestError = nil;
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&requestError];
    
    NSDictionary *dict;
    
    if (requestError == nil) {
        
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&requestError];
        
        DLog(@"Response %@",json);
        
        dict=json;
    }
    
        NSError *error;
        
        WMUser *user1=[_rAppdata userObject];
        [user1 destroyPreferences];
        
        WMUser *user_detail = [[WMUser alloc] initWithDictionary:[dict objectForKey:@"User"] error:&error];
        
        [user_detail setuserData:[dict objectForKey:@"User"] ];
    
    [SVProgressHUD dismiss];

}


@end
