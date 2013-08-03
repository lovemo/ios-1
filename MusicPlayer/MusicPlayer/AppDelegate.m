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
    //背景
    UIImageView *backfroundImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, 320, 460)];
    backfroundImageView.image = [UIImage imageNamed:@"background.jpg"];
    [self.window addSubview:backfroundImageView];
    //创建歌曲和歌手label
    self.songLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.songLabel.center = CGPointMake(180, 50);
    self.songLabel.backgroundColor = [UIColor clearColor];
    self.songLabel.text = @"Knocking on Heaven's Door";
    self.songLabel.font = [UIFont systemFontOfSize:15];
    self.songLabel.textAlignment = NSTextAlignmentRight;
    [self.window addSubview:self.songLabel];
    
    self.singerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 50)];
    self.singerLabel.center = CGPointMake(180, 80);
    self.singerLabel.backgroundColor = [UIColor clearColor];
    self.singerLabel.text = @"Guns N' Roses";
    self.singerLabel.textAlignment = NSTextAlignmentCenter;
    [self.window addSubview:self.singerLabel];
    
    //创建进度条
    self.songProgress = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 300, 10)];
    self.songProgress.center = CGPointMake(160, 100);
    self.songProgress.backgroundColor = [UIColor clearColor];
    [self.songProgress setMaximumTrackImage:[UIImage imageNamed:@"sliderBack.png"] forState:UIControlStateNormal];
    [self.songProgress setMinimumTrackImage:[UIImage imageNamed:@"sliderBack.png"] forState:UIControlStateNormal];
    [self.songProgress setThumbImage:[UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.songProgress setThumbImage:[UIImage imageNamed:@"slider.png"] forState:UIControlStateHighlighted];
    [self.songProgress addTarget:self action:@selector(progressChange:) forControlEvents:UIControlEventValueChanged];
    [self.window addSubview:self.songProgress];
    
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(onTime:) userInfo:nil repeats:YES];
    
    //半透明背景
    UIImageView *buttonBackground = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
    buttonBackground.image = [UIImage imageNamed:@"buttonBackground.png"];
    buttonBackground.center = CGPointMake(160, 440);
    [self.window addSubview:buttonBackground];
    
    //创建按钮
    self.playButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.playButton.tag = 1000;
    self.playButton.center = CGPointMake(30, 450);
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    [self.playButton addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:self.playButton];
    
    self.pauseButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.pauseButton.tag = 1001;
    self.pauseButton.center = CGPointMake(290, 450);
    [self.pauseButton setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    [self.pauseButton addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:self.pauseButton];
    
    self.quiteButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    self.quiteButton.tag = 1002;
    self.quiteButton .center = CGPointMake(40, 60);
    [self.quiteButton setBackgroundImage:[UIImage imageNamed:@"quite.png"] forState:UIControlStateNormal];
    [self.quiteButton addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:self.quiteButton];
    
    //音量调节
    self.volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(0,0, 200, 20)];
    self.volumeSlider.center = CGPointMake(160, 450);
    self.volumeSlider.backgroundColor = [UIColor clearColor];
    self.volumeSlider.value = 0.5;
    [self.volumeSlider setMaximumTrackImage:[UIImage imageNamed:@"sliderBack.png"] forState:UIControlStateNormal];
    [self.volumeSlider setMinimumTrackImage:[UIImage imageNamed:@"sliderBack.png"] forState:UIControlStateNormal];
    [self.volumeSlider setThumbImage:[UIImage imageNamed:@"slider.png"] forState:UIControlStateNormal];
    [self.volumeSlider setThumbImage:[UIImage imageNamed:@"slider.png"] forState:UIControlStateHighlighted];
    [self.volumeSlider addTarget:self action:@selector(volumeChange:) forControlEvents:UIControlEventValueChanged];
    [self.window addSubview:self.volumeSlider];

    //添加播放器
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Knockin'_on_Heaven's_Door" ofType:@"mp3"];
    NSURL *url = [[NSURL alloc]initFileURLWithPath:path];
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    
    //进度条下时间显示
    self.durationLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    self.durationLabel.center = CGPointMake(300, 120);
    self.durationLabel.backgroundColor = [UIColor clearColor];
    int min = self.player.duration/60;
    int sec = (int)self.player.duration%60;
    self.durationLabel.text = [NSString stringWithFormat:@"%d:%d",min,sec];
    [self.window addSubview:self.durationLabel];
    
    self.currentTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    self.currentTimeLabel.center = CGPointMake(35, 120);
    self.currentTimeLabel.backgroundColor = [UIColor clearColor];
    self.currentTimeLabel.text = @"0:00";
    [self.window addSubview:self.currentTimeLabel];
    
    
    return YES;
}

-(void)onButton:(UIButton *)button
{
    switch (button.tag) {
        case 1000:
            [self.player play];
            break;
        case 1001:
            NSLog(@"pause");
            [self.player pause];
            break;
        case 1002:
            if (self.player.volume ==0) {
                self.player.volume = self.volumeSlider.value;
            }else{
                self.player.volume = 0;
            }
            break;
        default:
            break;
    }
}

-(void)progressChange:(UISlider *)slider
{
    self.player.currentTime = slider.value * self.player.duration;
}

-(void)onTime:(id)sender
{
    self.songProgress.value = self.player.currentTime/self.player.duration;
    int min = self.player.currentTime / 60;
    int sec = (int)self.player.currentTime % 60;
    self.currentTimeLabel.text = [NSString stringWithFormat:@"%d:%02d",min,sec];
}

-(void)volumeChange:(UISlider *)slider
{
    self.player.volume = slider.value;
}



@end
