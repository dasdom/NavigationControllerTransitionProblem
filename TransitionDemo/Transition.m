//
//  Transition.m
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import "Transition.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation Transition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    SecondViewController *fromVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FirstViewController *toVC = (FirstViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *theContainerView = transitionContext.containerView;
    
    [theContainerView addSubview:fromVC.view];
    [theContainerView addSubview:toVC.view];

    [theContainerView bringSubviewToFront:fromVC.view];

    UIView *intermediateView = [UIView new];
    intermediateView.frame = fromVC.blueView.frame;
    intermediateView.backgroundColor = fromVC.blueView.backgroundColor;
    
    [theContainerView addSubview:intermediateView];
    
    toVC.view.frame = fromVC.view.frame;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{

        intermediateView.frame = toVC.redView.frame;
        intermediateView.backgroundColor = toVC.redView.backgroundColor;
        
        fromVC.view.frame = CGRectOffset(fromVC.view.frame, fromVC.view.frame.size.width, 0);

    } completion:^(BOOL finished) {
        
        [intermediateView removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
}

@end
