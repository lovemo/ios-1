//
//  RootViewController.h
//  MusicPlayer
//
//  Created by zerd on 13-8-3.
//  Copyright (c) 2013年 zerd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController

@property (strong, nonatomic) UILabel *songLabel,*singerLabel;
@property (strong, nonatomic) UISlider *songProgress,*volumeSlider;
@property (strong, nonatomic) UILabel *currentTimeLabel,*durationLabel;
@property (strong, nonatomic) UIButton *playButton,*pauseButton,*quiteButton;
@property (strong, nonatomic) AVAudioPlayer *player;

@end
