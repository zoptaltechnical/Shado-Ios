//
//  SignUpViewController.m
//  shadow
//
//  Created by Eshan cheema on 12/14/17.
//  Copyright © 2017 Geetika. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    signUpbtn.layer.cornerRadius =4;
    signUpbtn.clipsToBounds = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cameraBtnPressed:(id)sender
{
    
}
- (IBAction)signUpbtnPressed:(id)sender
{
    
}
- (IBAction)signInBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
