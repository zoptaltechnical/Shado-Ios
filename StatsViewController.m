//
//  StatsViewController.m
//  shado
//
//  Created by Gorav Grover on 23/02/18.
//  Copyright © 2018 Geetika. All rights reserved.
//

#import "StatsViewController.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)persoanlProfileBtnPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"PersonalProfile" bundle:[NSBundle mainBundle]];
    personalProfileViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"personalProfileViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [navController setNavigationBarHidden:YES animated:YES];
    
    [self presentViewController:navController animated:YES completion:nil];
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
