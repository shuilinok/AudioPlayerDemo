//
//  AudioFilePlayerStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStartAction.h"

@implementation AudioFilePlayerStartAction

- (void)run
{
    self.player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    self.player.state = AudioPlayer_State_Started;
}

@end
