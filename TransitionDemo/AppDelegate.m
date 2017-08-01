//
//  AppDelegate.m
//  TransitionDemo
//
//  Created by Dominik Hauser on 01.08.17.
//  Copyright © 2017 Dominik Hauser. All rights reserved.
//

#import "AppDelegate.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "NavigationControllerDelegate.h"

@interface AppDelegate ()
@property NavigationControllerDelegate *navigationControllerDelegate;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[FirstViewController new]];
    self.navigationControllerDelegate = [NavigationControllerDelegate new];
    navigationController.delegate = self.navigationControllerDelegate;
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
