//
//  AudioFilePlayerStopAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStopAction.h"

@implementation AudioFilePlayerStopAction

- (void)stopRun
{
    self.player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    
    self.player.state = AudioPlayer_State_Stopped;
}

@end
