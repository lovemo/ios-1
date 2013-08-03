//
//  AppDelegate.m
//  MusicPlayer
//
//  Created by zerd on 13-8-2.
//  Copyright (c) 2013年 zerd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.rootViewController = [[RootViewController alloc]init];
    self.window.rootViewController = self.rootViewController;
    return YES;
}

@end
