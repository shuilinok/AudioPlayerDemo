//
//  AudioPlayerStateControlPolicy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerStateControlPolicy.h"
#import "AudioPlayerControlPolicy_Private.h"


@interface AudioPlayerStateControlPolicy ()

//停止后自动又开始
@property (assign, nonatomic) BOOL autoStartWhenStopped;

@end

@implementation AudioPlayerStateControlPolicy

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
        self.autoStartWhenStopped = YES;
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

- (void)handleChangedState:(AudioPlayer_State)state
{
    if(state == AudioPlayer_State_Stopped)
    {
        if(self.autoStartWhenStopped)
        {
            self.autoStartWhenStopped = NO;
            [self.player start];
        }
    }
}

@end
