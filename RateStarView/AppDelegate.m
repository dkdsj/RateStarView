//
//  AppDelegate.m
//  RateStarView
//
//  Created by zz on 2019/6/13.
//  Copyright © 2019 zz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
