//
//  FirstViewController.m
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import "FirstViewController.h"

#import "SecondViewController.h"

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(10, 80, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.redView];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(push)];
    [self.redView addGestureRecognizer:tapRecognizer];
}

- (void)push {
    [self.navigationController pushViewController:[SecondViewController new] animated:true];
}

@end
