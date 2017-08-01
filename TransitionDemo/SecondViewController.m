//
//  SecondViewController.m
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import "SecondViewController.h"

#import "NavigationControllerDelegate.h"

@interface SecondViewController ()
@property CGPoint panStartLocation;
@property UIPercentDrivenInteractiveTransition *interactiveTransition;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];

    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 200, 200)];
    self.blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.blueView];
    
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)]];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
    CGPoint location = [sender locationInView:self.view];
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            NSLog(@"UIGestureRecognizerStateBegan");
            self.panStartLocation = location;
            self.interactiveTransition = [UIPercentDrivenInteractiveTransition new];
            ((NavigationControllerDelegate *)self.navigationController.delegate).interactiveTransition = self.interactiveTransition;
            [self.navigationController popViewControllerAnimated:true];
            break;
        case UIGestureRecognizerStateChanged: {
            CGFloat percentage = fabs(1-(self.panStartLocation.x - location.x)/sender.view.frame.size.width);
            NSLog(@"UIGestureRecognizerStateChanged: %lf", percentage);
            [self.interactiveTransition updateInteractiveTransition:percentage];
            break;
        }
        default: {
            NSLog(@"default");
            CGFloat percentage = (location.x - self.panStartLocation.x)/sender.view.frame.size.width;
            if (percentage > 0.8) {
                [self.interactiveTransition finishInteractiveTransition];
            } else {
                [self.interactiveTransition cancelInteractiveTransition];
            }
            self.interactiveTransition = nil;
            break;
        }
    }
}

@end
