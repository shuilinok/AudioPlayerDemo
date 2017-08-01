//
//  AudioFilePlayerCheckStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerCheckStartAction.h"

@implementation AudioFilePlayerCheckStartAction

- (void)checkStartRun
{
    self.player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    
    self.player.state = AudioPlayer_State_Started;
}

@end
