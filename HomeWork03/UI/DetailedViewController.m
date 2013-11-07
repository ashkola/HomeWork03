//
//  DetailedViewController.m
//  HomeWork03
//
//  Created by Admin on 11/7/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)goBackAction:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
