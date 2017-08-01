//
//  NavigationControllerDelegate.h
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigationControllerDelegate : NSObject <UINavigationControllerDelegate>
@property (weak) UIPercentDrivenInteractiveTransition *interactiveTransition;
@end
