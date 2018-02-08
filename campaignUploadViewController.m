//
//  campaignUploadViewController.m
//  shado
//
//  Created by Eshan cheema on 1/18/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "campaignUploadViewController.h"
#import "ActionSheetDatePicker.h"

#import "AbstractActionSheetPicker.h"
@interface campaignUploadViewController ()<UIActionSheetDelegate>
{
    ActionSheetDatePicker *actionSheetPicker;
    AbstractActionSheetPicker*actionSheet;
    NSDate *now, *currentDate;
    NSDate *selectedDate;
    NSString *stringmonth,*stringyear;
    id btnClicked;
    
}
@end

@implementation campaignUploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    uploadImageUiview.layer.borderColor = [UIColor lightGrayColor].CGColor;
    uploadImageUiview.layer.borderWidth = 1.0f;
    createcampaignBtn.layer.cornerRadius=20.0f;
    createcampaignBtn.clipsToBounds=YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender
{
[self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)startDateBtn:(id)sender {
    [self.view endEditing:YES];
    _startDateBtn = sender;
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString*dateString = [dateFormat stringFromDate:[NSDate date]];
    
    NSDate *date = [dateFormat dateFromString:dateString];
    date = [NSDate date];
    actionSheetPicker = [[ActionSheetDatePicker alloc] initWithTitle:@"" datePickerMode:UIDatePickerModeDate selectedDate:date target:self action:@selector(dateCreateSelected:element:) origin:sender];
    
    
    actionSheetPicker.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    actionSheetPicker.minimumDate=currentDate;
    
    
    
    actionSheetPicker.hideCancel = NO;
    
    [actionSheetPicker showActionSheetPicker];
}

- (IBAction)createCampaignBtnPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    NewCreateViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"NewCreateViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];

    
    
}
#pragma mark - Selected Date Action
- (void)dateCreateSelected:(NSDate *)selectedDate11 element:(id)element
{
    [self.view endEditing:YES];
    UIButton *btn=(UIButton*)_startDateBtn;
    selectedDate = selectedDate11;
    NSDateFormatter *dateFormatterNew = [[NSDateFormatter alloc] init];
    [dateFormatterNew setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    
    [dateFormatterNew setDateFormat:@"dd/MM/yyyy"];
    
    NSString *stringForNewDate =[dateFormatterNew stringFromDate:selectedDate];
    NSArray* monthArray = [stringForNewDate componentsSeparatedByString: @"/"];
    stringmonth = [monthArray objectAtIndex:1];
    stringyear = [monthArray objectAtIndex:2];
    [btn setTitle:stringForNewDate forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}

- (IBAction)uploadBtn:(id)sender
{
    
}
@end
