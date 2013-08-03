//
//  AppDelegate.h
//  MusicPlayer
//
//  Created by zerd on 13-8-2.
//  Copyright (c) 2013年 zerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "RootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;
@end
