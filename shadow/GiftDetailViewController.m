//
//  GiftDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 1/11/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "GiftDetailViewController.h"

@interface GiftDetailViewController ()

@end

@implementation GiftDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self intialValues];
    [self callDetailListing];
    // Do any additional setup after loading the view.
}
-(void)callDetailListing
{
    NSLog(@"giftDetail %@",_giftcampaignDict);
    
    
    
    
}
-(void)intialValues
{
    doanteBtn.layer.cornerRadius=20.0f;
    doanteBtn.clipsToBounds=YES;
    popUpDonateBtn.layer.cornerRadius=20.0f;
    popUpDonateBtn.clipsToBounds=YES;
    [backgroundView setHidden:YES];
    backgroundView.backgroundColor=[[UIColor blackColor]colorWithAlphaComponent:0.55];
    
    priceAmtBtnone.layer.cornerRadius=15.0f;
    priceAmtBtnone.clipsToBounds=YES;
    priceAmtBtnone.layer.borderColor = [UIColor darkGrayColor].CGColor;
    priceAmtBtnone.layer.borderWidth = 1.0f;

    priceAmtBtnTwo.layer.cornerRadius=15.0f;
    priceAmtBtnTwo.clipsToBounds=YES;
    priceAmtBtnTwo.layer.borderColor = [UIColor darkGrayColor].CGColor;
    priceAmtBtnTwo.layer.borderWidth = 1.0f;

    
    priceAmtBtnThree.layer.cornerRadius=15.0f;
    priceAmtBtnThree.clipsToBounds=YES;
    priceAmtBtnThree.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnThree.layer.borderWidth = 1.0f;

    
    priceAmtBtnFour.layer.cornerRadius=15.0f;
    priceAmtBtnFour.clipsToBounds=YES;
    priceAmtBtnFour.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnFour.layer.borderWidth = 1.0f;


    priceAmtBtnFifth.layer.cornerRadius=15.0f;
    priceAmtBtnFifth.clipsToBounds=YES;
    priceAmtBtnFifth.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnFifth.layer.borderWidth = 1.0f;
    
    priceAmtBtnSixth.layer.cornerRadius=15.0f;
    priceAmtBtnSixth.clipsToBounds=YES;
    priceAmtBtnSixth.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnSixth.layer.borderWidth = 1.0f;

    priceAmtBtnSeventh.layer.cornerRadius=15.0f;
    priceAmtBtnSeventh.clipsToBounds=YES;
    priceAmtBtnSeventh.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnSeventh.layer.borderWidth = 1.0f;
    
    
    priceAmtBtnEigth.layer.cornerRadius=15.0f;
    priceAmtBtnEigth.clipsToBounds=YES;
    priceAmtBtnEigth.layer.borderColor =  [UIColor darkGrayColor].CGColor;
    priceAmtBtnEigth.layer.borderWidth = 1.0f;
    
    priceAmtBtnNine.layer.cornerRadius=15.0f;
    priceAmtBtnNine.clipsToBounds=YES;
    priceAmtBtnNine.layer.borderColor = [UIColor darkGrayColor].CGColor;
    priceAmtBtnNine.layer.borderWidth = 1.0f;

    otherAmtBtn.layer.cornerRadius=15.0f;
    otherAmtBtn.clipsToBounds=YES;
   otherAmtBtn.layer.borderColor =  [UIColor darkGrayColor].CGColor;
   otherAmtBtn.layer.borderWidth = 1.0f;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popUpDonateBtnPressed:(id)sender
{
    [backgroundView setHidden:YES];
    
    
    GiftCreditCardPaymentViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftCreditCardPaymentViewController"];
    
    [self.navigationController pushViewController:secondView animated:YES];

    
}


- (IBAction)backBtnPressed:(id)sender
{
     [self.navigationController popToRootViewControllerAnimated:NO];
}
- (IBAction)donateBtnPressed:(id)sender
{
       [backgroundView setHidden:NO];
}
- (IBAction)profilebtnPressed:(id)sender
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
}

@end
