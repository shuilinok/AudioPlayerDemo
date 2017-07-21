//
//  AudioPlayerControlPolicy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerControlPolicy.h"
#import "AudioPlayer.h"

@interface AudioPlayerControlPolicy ()


@end


@implementation AudioPlayerControlPolicy

- (void)dealloc
{
    self.player = nil;
}

- (void)start
{
    AudioPlayer_State state = self.player.state;
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        [self.player start];
    }
    else if(state == AudioPlayer_State_Stopping)
    {
        //也是可以start的
    }
    else
    {
        
    }
}

- (void)stop
{
    AudioPlayer_State state = self.player.state;
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        [self.player stop];
    }
    else
    {
        
    }
}

@end
