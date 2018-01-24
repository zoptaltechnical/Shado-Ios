//
//  GiftMerchandiseDetailViewController.m
//  shado
//
//  Created by Eshan cheema on 1/23/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "GiftMerchandiseDetailViewController.h"

@interface GiftMerchandiseDetailViewController ()

@end

@implementation GiftMerchandiseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    buyNowBtn.layer.cornerRadius=20.0f;
    buyNowBtn.clipsToBounds=YES;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
- (IBAction)buyNowBtnPressed:(id)sender
{
    GiftCreditCardPaymentViewController *secondView = [self.storyboard instantiateViewControllerWithIdentifier:@"GiftCreditCardPaymentViewController"];
    
    [self.navigationController pushViewController:secondView animated:YES];
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
