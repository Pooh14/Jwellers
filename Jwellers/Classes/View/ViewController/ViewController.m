//
//  ViewController.m
//  Jwellers
//
//  Created by pooja patel on 25/06/14.
//  Copyright (c) 2014 pooja patel. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self performSelector:@selector(pushToMainViewController) withObject:nil afterDelay:2.0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) viewWillAppear:(BOOL)animated{
}

- (void)pushToMainViewController
{
    [self performSegueWithIdentifier:@"MainView" sender:self];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
