//
//  AudioFilePlayerRequest.m
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioFilePlayerRequest.h"
#import "AudioFilePlayer.h"

@implementation AudioFilePlayerStartRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    player.state = AudioPlayer_State_Started;
    
    self.code = noErr;
    [self finish];
}

@end


@implementation AudioFilePlayerStopRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    NSLog(@"stopping");
    
    player.state = AudioPlayer_State_Stopped;
    
    self.code = noErr;
    [self finish];
}

@end



