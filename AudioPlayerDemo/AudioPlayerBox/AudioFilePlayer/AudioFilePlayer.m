//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@implementation AudioFilePlayer

- (void)start:(AudioPlayerCancelContext *)context
{
    AudioPlayer *player = self;
    
    player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    player.state = AudioPlayer_State_Started;
}

- (void)stop
{
    AudioPlayer *player = self;
    
    player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    NSLog(@"stopping");
    
    player.state = AudioPlayer_State_Stopped;
    
}

@end



