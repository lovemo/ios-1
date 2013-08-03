//
//  AppDelegate.h
//  MusicPlayer
//
//  Created by zerd on 13-8-2.
//  Copyright (c) 2013年 zerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UILabel *songLabel,*singerLabel;
@property (strong, nonatomic) UISlider *songProgress,*volumeSlider;
@property (strong, nonatomic) UILabel *currentTimeLabel,*durationLabel;
@property (strong, nonatomic) UIButton *playButton,*pauseButton,*quiteButton;
@property (strong, nonatomic) AVAudioPlayer *player;

@end
