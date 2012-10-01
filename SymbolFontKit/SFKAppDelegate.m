//
//  SFKAppDelegate.m
//  SymbolFontKit
//
//  Created by kishikawa katsumi on 2012/08/25.
//  Copyright (c) 2012 kishikawa katsumi. All rights reserved.
//

#import "SFKAppDelegate.h"

#import "SFKViewController.h"

@implementation SFKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[SFKViewController alloc] initWithNibName:@"SFKViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
