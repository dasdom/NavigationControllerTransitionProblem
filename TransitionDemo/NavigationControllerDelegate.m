//
//  NavigationControllerDelegate.m
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import "NavigationControllerDelegate.h"

#import "Transition.h"

@implementation NavigationControllerDelegate

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    return operation == UINavigationControllerOperationPop ? [Transition new] : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    self.interactiveTransition.completionSpeed = 0.999;
    
    return self.interactiveTransition;
}

@end
