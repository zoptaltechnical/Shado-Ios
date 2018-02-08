//
//  GiftCreditCardPaymentViewController.m
//  shado
//
//  Created by Eshan cheema on 1/23/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "GiftCreditCardPaymentViewController.h"

@interface GiftCreditCardPaymentViewController ()
{
    ActionSheetDatePicker *actionSheetPicker;
    NSDate *selectedDate,*currentDate;
    id btnClicked;
    NSString *stringmonth;
    NSString *stringyear,*cardtype,*cardNumberString;
    AbstractActionSheetPicker*actionSheet;
}
@end

@implementation GiftCreditCardPaymentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardNumberField.showsCardLogo = YES;
    [self.cardNumberField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    submitBtn.layer.cornerRadius=20.0f;
    submitBtn.clipsToBounds=YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(id)sender {
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)personalProfileButtonPressed:(id)sender {
    
        
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
        personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
        [navController setNavigationBarHidden:YES animated:YES];
        
        [self presentViewController:navController animated:YES completion:nil];
    

}
- (IBAction)submitBtnPressed:(id)sender
{
}

- (IBAction)expiryDateBtnPressed:(id)sender
{
    [self.view endEditing:YES];
    
    btnClicked = sender;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString*dateString = [dateFormat stringFromDate:[NSDate date]];
    
    NSDate *date = [dateFormat dateFromString:dateString];
    currentDate = [NSDate date];
    actionSheetPicker = [[ActionSheetDatePicker alloc] initWithTitle:@"" datePickerMode:UIDatePickerModeDate selectedDate:date target:self action:@selector(dateCreateSelected:element:) origin:sender];
    
    actionSheetPicker.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    actionSheetPicker.minimumDate=currentDate;
    actionSheetPicker.hideCancel = NO;
    
    [actionSheetPicker showActionSheetPicker];
}

#pragma mark - Selected Date Action
- (void)dateCreateSelected:(NSDate *)selectedDate11 element:(id)element
{
    [self.view endEditing:YES];
    UIButton *btn=(UIButton*)btnClicked;
    selectedDate = selectedDate11;
    NSDateFormatter *dateFormatterNew = [[NSDateFormatter alloc] init];
    [dateFormatterNew setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [dateFormatterNew setDateFormat:@"dd/MM/yyyy"];
    
    NSString *stringForNewDate =[dateFormatterNew stringFromDate:selectedDate];
    NSArray* monthArray = [stringForNewDate componentsSeparatedByString: @"/"];
    stringmonth = [monthArray objectAtIndex:1];
    stringyear = [monthArray objectAtIndex:2];
    [btn setTitle:stringForNewDate forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    
}


- (void)textFieldEditingChanged:(id)sender
{
    if (sender == self.cardNumberField) {
        
        NSString *cardCompany = self.cardNumberField.cardCompanyName;
        if (nil == cardCompany)
        {
            cardCompany = @"unknown";
        }
        cardtype=[NSString stringWithFormat:@"%@", cardCompany];
        NSLog(@"label>> %@",cardtype);
        cardNumberString = [self.cardNumberField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        
    }
    
}
- (IBAction)submitButtonPressed:(id)sender {
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
