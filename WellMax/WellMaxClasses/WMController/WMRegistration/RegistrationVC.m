//
//  RegistrationVC.m
//  SampleCode
//
//  Created by Apple on 9/29/15.
//  Copyright (c) 2015 EVS. All rights reserved.
//

#import "RegistrationVC.h"
#import "AppDelegate.h"
#import "TabBarVC.h"
#import "Utils.h"
#import "ViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

@interface RegistrationVC (){
    
    
    NSArray *arrcountry;
    NSArray *arrempStatus;
    NSArray *arrpayRange;
    
    int selectedTextFieldValue;
    UITextField *selectedTextField;
    UIPopoverController *popover;
    UIToolbar *myToolbar;
}

@end

@implementation RegistrationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    txtSelectCity.delegate = self;
    txtCurrentPayRange.delegate = self;
    txtCurrentEmployment.delegate = self;
    
    [scrollVieww setContentSize:CGSizeMake(320, 810)];
         lblRegisterNow.font=[UIFont fontWithName:@"Montserrat-Regular" size:19];

    UIColor *color = [UIColor whiteColor];
    
         txtCellPhoneNumber.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   CellPhoneNumber" attributes:@{NSForegroundColorAttributeName: color}];
          txtCellPhoneNumber.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];

    
         txtCellPhoneProvider.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   CellPhoneProvider" attributes:@{NSForegroundColorAttributeName: color}];
          txtCellPhoneProvider.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
         txtCity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   City" attributes:@{NSForegroundColorAttributeName: color}];
          txtCity.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
         txtCurrentEmployment.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   CurrentEmployment" attributes:@{NSForegroundColorAttributeName: color}];
          txtCurrentEmployment.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
         txtCurrentPayRange.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   CurrentPayRange" attributes:@{NSForegroundColorAttributeName: color}];
          txtCurrentPayRange.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
    txtEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Email" attributes:@{NSForegroundColorAttributeName: color}];
          txtEmail.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
         txtFullName.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   FullName" attributes:@{NSForegroundColorAttributeName: color}];
          txtFullName.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
    
    txtSelectCity.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   SelectCity" attributes:@{NSForegroundColorAttributeName: color}];
    txtSelectCity.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
         
    
    txtZipcoDE.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Zipcode" attributes:@{NSForegroundColorAttributeName: color}];
    txtZipcoDE.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
    
    txtUsername.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Username" attributes:@{NSForegroundColorAttributeName: color}];
    txtUsername.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];
    
    txtPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Password" attributes:@{NSForegroundColorAttributeName: color}];
    txtPassword.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];


         UIView *addStatusBar = [[UIView alloc] init];

         addStatusBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 20);

         addStatusBar.backgroundColor = [UIColor blackColor];

         [self.view addSubview:addStatusBar];


         UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(dismissKeyboard)];

         [self.view addGestureRecognizer:tap];


         self.view.backgroundColor=[UIColor colorWithRed:199.0/259.0 green:52.0/259.0 blue:75.0/259.0 alpha:1];

//************************  YOU HAVE AN ACCOUNT?  ******************************

         [btnYouHaveAnAccount setTitle:@"You have an account?" forState:UIControlStateNormal];

         [btnYouHaveAnAccount setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnYouHaveAnAccount.layer.cornerRadius=4;

         btnYouHaveAnAccount.clipsToBounds=YES;

         btnYouHaveAnAccount.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:12];


//************************ SIGNIN BUTTON ***************************************


         if (IS_IPAD_iPad_SCREEN) {

                  [btnSignIn setTitle:@"SIGN IN" forState:UIControlStateNormal];

                  [btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

                  btnSignIn.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:27];
                  
         }
         
         else
                  
         {

         [btnSignIn setTitle:@"SIGN IN" forState:UIControlStateNormal];

         [btnSignIn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

         btnSignIn.backgroundColor=[UIColor clearColor];

         btnSignIn.layer.cornerRadius=4;

         btnSignIn.clipsToBounds=YES;

          btnSignIn.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];

         }

//************************ SIGNUP BUTTON ***********************************



//BUTTON CORNER SHAPE

         btnSignUp.layer.cornerRadius=4;

         btnSignUp.clipsToBounds=YES;


//BUTTON TEXT
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

         btnSignUp.titleLabel.font=[UIFont fontWithName:@"Montserrat-Regular" size:18];

         }

//BUTTON BACKGROUND COLOR
         btnSignUp.backgroundColor=[UIColor colorWithRed:174.0/259.0 green:46.0/259.0 blue:68.0/259.0 alpha:1];
    [self getCountry];
    [self getEmpStatus];
    [self getPayRange];
    
}

-(void)tabBarPageClick{
        
}




-(void)getCountry{
    
    arrcountry = @[@"Afghanistan",
                   @"Albania",
                   @"Algeria",
                   @"Andorra",
                   @"Angola",
                   @"Antigua & Deps",
                   @"Argentina",
                   @"Armenia",
                   @"Australia",
                   @"Austria",
                   @"Azerbaijan",
                   @"Bahamas",
                   @"Bahrain",
                   @"Bangladesh",
                   @"Barbados",
                   @"Belarus",
                   @"Belgium",
                   @"Belize",
                   @"Benin",
                   @"Bhutan",
                   @"Bolivia",
                   @"Bosnia Herzegovina",
                   @"Botswana",
                   @"Brazil",
                   @"Brunei",
                   @"Bulgaria",
                   @"Burkina",
                   @"Burundi",
                   @"Cambodia",
                   @"Cameroon",
                   @"Canada",
                   @"Cape Verde",
                   @"Central African Rep",
                   @"Chad",
                   @"Chile",
                   @"China",
                   @"Colombia",
                   @"Comoros",
                   @"Congo",
                   @"Congo {Democratic Rep}",
                   @"Costa Rica",
                   @"Croatia",
                   @"Cuba",
                   @"Cyprus",
                   @"Czech Republic",
                   @"Denmark",
                   @"Djibouti",
                   @"Dominica",
                   @"Dominican Republic",
                   @"East Timor",
                   @"Ecuador",
                   @"Egypt",
                   @"El Salvador",
                   @"Equatorial Guinea",
                   @"Eritrea",
                   @"Estonia",
                   @"Ethiopia",
                   @"Fiji",
                   @"Finland",
                   @"France",
                   @"Gabon",
                   @"Gambia",
                   @"Georgia",
                   @"Germany",
                   @"Ghana",
                   @"Greece",
                   @"Grenada",
                   @"Guatemala",
                   @"Guinea",
                   @"Guinea-Bissau",
                   @"Guyana",
                   @"Haiti",
                   @"Honduras",
                   @"Hungary",
                   @"Iceland",
                   @"India",
                   @"Indonesia",
                   @"Iran",
                   @"Iraq",
                   @"Ireland {Republic}",
                   @"Israel",
                   @"Italy",
                   @"Ivory Coast",
                   @"Jamaica",
                   @"Japan",
                   @"Jordan",
                   @"Kazakhstan",
                   @"Kenya",
                   @"Kiribati",
                   @"Korea North",
                   @"Korea South",
                   @"Kosovo",
                   @"Kuwait",
                   @"Kyrgyzstan",
                   @"Laos",
                   @"Latvia",
                   @"Lebanon",
                   @"Lesotho",
                   @"Liberia",
                   @"Libya",
                   @"Liechtenstein",
                   @"Lithuania",
                   @"Luxembourg",
                   @"Macedonia",
                   @"Madagascar",
                   @"Malawi",
                   @"Malaysia",
                   @"Maldives",
                   @"Mali",
                   @"Malta",
                   @"Marshall Islands",
                   @"Mauritania",
                   @"Mauritius",
                   @"Mexico",
                   @"Micronesia",
                   @"Moldova",
                   @"Monaco",
                   @"Mongolia",
                   @"Montenegro",
                   @"Morocco",
                   @"Mozambique",
                   @"Myanmar, {Burma}",
                   @"Namibia",
                   @"Nauru",
                   @"Nepal",
                   @"Netherlands",
                   @"New Zealand",
                   @"Nicaragua",
                   @"Niger",
                   @"Nigeria",
                   @"Norway",
                   @"Oman",
                   @"Pakistan",
                   @"Palau",
                   @"Panama",
                   @"Papua New Guinea",
                   @"Paraguay",
                   @"Peru",
                   @"Philippines",
                   @"Poland",
                   @"Portugal",
                   @"Qatar",
                   @"Romania",
                   @"Russian Federation",
                   @"Rwanda",
                   @"St Kitts & Nevis",
                   @"St Lucia",
                   @"Saint Vincent & the Grenadines",
                   @"Samoa",
                   @"San Marino",
                   @"Sao Tome & Principe",
                   @"Saudi Arabia",
                   @"Senegal",
                   @"Serbia",
                   @"Seychelles",
                   @"Sierra Leone",
                   @"Singapore",
                   @"Slovakia",
                   @"Slovenia",
                   @"Solomon Islands",
                   @"Somalia",
                   @"South Africa",
                   @"South Sudan",
                   @"Spain",
                   @"Sri Lanka",
                   @"Sudan",
                   @"Suriname",
                   @"Swaziland",
                   @"Sweden",
                   @"Switzerland",
                   @"Syria",
                   @"Taiwan",
                   @"Tajikistan",
                   @"Tanzania",
                   @"Thailand",
                   @"Togo",
                   @"Tonga",
                   @"Trinidad & Tobago",
                   @"Tunisia",
                   @"Turkey",
                   @"Turkmenistan",
                   @"Tuvalu",
                   @"Uganda",
                   @"Ukraine",
                   @"United Arab Emirates",
                   @"United Kingdom",
                   @"United States",
                   @"Uruguay",
                   @"Uzbekistan",
                   @"Vanuatu",
                   @"Vatican City",
                   @"Venezuela",
                   @"Vietnam",
                   @"Yemen",
                   @"Zambia",
                   @"Zimbabwe",];
    
}

-(void)getEmpStatus{
    
    arrempStatus = @[@"UnEmployed", @"Full time", @"Part time"];
    
}

-(void)getPayRange{
    
    arrpayRange = @[@"$0 - $20,000",@"$20,000 - $50,000",@"$50,000 - $100,000",@"$100,000 - $150,000",@"$150,000 - $200,000",@"$200,000 - $250,000", @"$250,000 or more"];
}

-(void)dismissKeyboard {

         [txtCellPhoneNumber resignFirstResponder];

         [txtCellPhoneProvider resignFirstResponder];

         [txtCity resignFirstResponder];

         [txtCurrentEmployment resignFirstResponder];

         [txtCurrentPayRange resignFirstResponder];

         [txtEmail resignFirstResponder];

         [txtFullName resignFirstResponder];

         [txtSelectCity resignFirstResponder];

         [txtZipcoDE resignFirstResponder];
    
        [txtUsername resignFirstResponder];
    
        [txtPassword resignFirstResponder];
    
}

-(IBAction)HideKeyboardClick:(id)sender{

         [txtCellPhoneNumber resignFirstResponder];

         [txtCellPhoneProvider resignFirstResponder];

         [txtCity resignFirstResponder];

         [txtCurrentEmployment resignFirstResponder];

         [txtCurrentPayRange resignFirstResponder];

         [txtEmail resignFirstResponder];

         [txtFullName resignFirstResponder];

         [txtSelectCity resignFirstResponder];

         [txtZipcoDE resignFirstResponder];
    
    [txtUsername resignFirstResponder];
    
    [txtPassword resignFirstResponder];

}

//****************************************************************************


-(IBAction)SinIn:(id)sender{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(IBAction)SignUp:(id)sender{
    
    if ([txtSelectCity.text isEqualToString:@""]==TRUE) {
        
        [Utils getAlert:@"Enter Your Country." view:self];
    }
    else
        if ([txtFullName.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Enter Your Name." view:self];
    }
    else
        if ([txtCity.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Enter Your City." view:self];
    }else
        if ([txtZipcoDE.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Enter Your Zip Code." view:self];
    }else
        if ([txtCellPhoneNumber.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Enter Your Mobile Number." view:self];
    }else
        if ([txtCellPhoneProvider.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Password can not be empty." view:self];
    }else
        if ([txtEmail.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Password can not be empty." view:self];
    }else
        if (![self validateEmailWithString:txtEmail.text]){
            [Utils getAlert:@"Please enter a valid email." view:self];
        }
    else
        if ([txtUsername.text isEqualToString:@""]==TRUE){
            
        [Utils getAlert:@"Username can not be empty." view:self];
            }
    else
        if ([txtPassword.text isEqualToString:@""]==TRUE){
                    
        [Utils getAlert:@"Password can not be empty." view:self];
            }
    else
        if ([txtCurrentEmployment.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Current Employment can not be empty." view:self];
    }else
        if ([txtCurrentPayRange.text isEqualToString:@""]==TRUE){
        
        [Utils getAlert:@"Current Pay Range can not be empty." view:self];
    }
    
    else
        if([Utils checkNetworkConnection]){
            
            [SVProgressHUD showWithStatus:@"Please Wait.." maskType:SVProgressHUDMaskTypeBlack];
            
            [self performSelector:@selector(signUp) withObject:self afterDelay:5.0 ];
        }
    
        else{
            [Utils getAlert:InternetMessage view:self];
        }
}

-(void)signUp{
    
//    UIStoryboard*storyboard=[AppDelegate storyBoardType];
//    ViewController*tabbarvc=(ViewController*)[storyboard instantiateViewControllerWithIdentifier:@"ViewControllerId"];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    tabbarvc=nil;
    
    
    NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
    [_params setObject:txtSelectCity.text forKey:@"country"];
    [_params setObject:txtFullName.text forKey:@"name"];
    [_params setObject:txtCity.text forKey:@"city"];
    [_params setObject:txtZipcoDE.text forKey:@"zip_code"];
    [_params setObject:txtCellPhoneNumber.text forKey:@"phone"];
    [_params setObject:txtCellPhoneProvider.text forKey:@"mobile"];
    [_params setObject:txtEmail.text forKey:@"emailId"];
    [_params setObject:txtUsername.text forKey:@"username"];
    [_params setObject:txtPassword.text forKey:@"password"];
    [_params setObject:txtCurrentEmployment.text forKey:@"emp_status"];
    [_params setObject:txtCurrentPayRange.text forKey:@"pay_range"];
   
    
    
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    NSURL* requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@", BaseURL, @"registration"]];
    
    
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
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
    
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
        
        NSLog(@"Response %@",json);
        
        dict=json;
    }
    
    [SVProgressHUD dismiss];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)textFieldDidBeginEditing:(UITextField *)textField {
         //Keyboard becomes visible
         scrollVieww.frame = CGRectMake(scrollVieww.frame.origin.x,
                                       scrollVieww.frame.origin.y,
                                       scrollVieww.frame.size.width,
                                       scrollVieww.frame.size.height - 215 + 50);   //resize
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
         //keyboard will hide
         scrollVieww.frame = CGRectMake(scrollVieww.frame.origin.x,
                                       scrollVieww.frame.origin.y,
                                       scrollVieww.frame.size.width,
                                       scrollVieww.frame.size.height + 215 - 50); //resize
}


//Email Validation

- (BOOL)validateEmailWithString:(NSString*)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    if (textField==txtSelectCity) {
        
        selectedTextFieldValue=(int)txtSelectCity.tag;
        textField.inputView=_pickerView;
        
    }
    if (textField==txtCurrentEmployment) {
        
        selectedTextFieldValue=(int)txtSelectCity.tag;
        textField.inputView=_pickerView;
    }
    if (textField==txtCurrentPayRange) {
        
        selectedTextFieldValue=(int)txtCurrentPayRange.tag;
        textField.inputView=_pickerView;
    }
    
    selectedTextField=textField;
    [_pickerView reloadAllComponents];
    [self popwithinformation];
    return YES;
}

// Picker View Implementation

-(void)popwithinformation{
    
    _pickerView=[[UIPickerView alloc]initWithFrame:CGRectMake(0, 43, 320, 480)];
    _pickerView.delegate=self;
    _pickerView.dataSource=self;
    _pickerView.backgroundColor=[UIColor whiteColor];
    [_pickerView setShowsSelectionIndicator:YES];
    
    txtCurrentPayRange.inputView=_pickerView;
    txtSelectCity.inputView=_pickerView;
    txtCurrentEmployment.inputView=_pickerView;
    
    myToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 56)];
    myToolbar.barStyle=UIBarStyleBlack;
    [myToolbar sizeToFit];
    myToolbar.backgroundColor=[UIColor whiteColor];
    
    NSMutableArray *barItems=[[NSMutableArray alloc]init];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:btnItem];
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(pickerDoneClicked)];
    [barItems addObject:doneBtn];
    [myToolbar setItems:barItems animated:YES];
    myToolbar.barStyle = UIBarButtonItemStylePlain;
    myToolbar.barTintColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.0f];
    myToolbar.tintColor=[UIColor blackColor];
    txtCurrentPayRange.inputAccessoryView=myToolbar;
    txtSelectCity.inputAccessoryView=myToolbar;
    txtCurrentEmployment.inputAccessoryView=myToolbar;
   
}


#pragma mark - Picker View data source

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    int count =0;
    switch (selectedTextFieldValue)
    {
        case 1:
            count =(int)arrcountry.count;
            break;
            
        case 2:
            count =(int)arrempStatus.count;
            break;
            
        case 3:
            count =(int)arrpayRange.count;
            break;
            
        default:
            NSLog(@"default count");
            break;
    }
    
    
    return count;
    
}

// tell the picker how many components it will have
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// tell the picker the title for a given component
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    NSString *title;
        switch (selectedTextFieldValue) {
            case 1:
                title =arrcountry[row];
                break;
                
            case 2:
                title =arrempStatus[row];
                break;
                
            case 3:
                title =arrpayRange[row];
                break;
                
            default:
                NSLog(@"default title");
                break;
        }
        
        return title;

}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = kSCREEN_WIDTH;
    
    return sectionWidth;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, kSCREEN_WIDTH, 40);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:14.0]];
        [pickerLabel setLineBreakMode:NSLineBreakByWordWrapping];
        pickerLabel.numberOfLines=0;
        
        
    }
    if (selectedTextField==txtSelectCity) {
        
        [pickerLabel setText:[arrcountry objectAtIndex:row]];
    }
    else
        if (selectedTextField==txtCurrentEmployment) {
            
            [pickerLabel setText:[arrempStatus objectAtIndex:row]];
        }
    else
        if (selectedTextField==txtCurrentPayRange) {
            
            [pickerLabel setText:[arrpayRange objectAtIndex:row]];
        }
    return pickerLabel;
    
}



- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if(selectedTextField==txtSelectCity)
    {
        
        txtSelectCity.text=[arrcountry objectAtIndex:row];
    }
    else
        if(selectedTextField==txtCurrentEmployment)
        {
            
            txtCurrentEmployment.text=[arrempStatus objectAtIndex:row];
        }

    else
        if(selectedTextField==txtCurrentPayRange)
        {
            
            txtCurrentPayRange.text=[arrpayRange objectAtIndex:row];
        }

}

-(void)pickerDoneClicked{
    
    
    [txtCurrentEmployment resignFirstResponder];
    [txtCurrentPayRange resignFirstResponder];
    [txtSelectCity resignFirstResponder];
}




@end
