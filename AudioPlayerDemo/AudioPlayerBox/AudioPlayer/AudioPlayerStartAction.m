//
//  AudioPlayerStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerStartAction.h"

@interface AudioPlayerStartAction ()

//停止后自动又开始
@property (assign, nonatomic) BOOL autoStartWhenStopped;

@end


@implementation AudioPlayerStartAction

- (void)run
{
    AudioPlayer_State state = self.player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        [self.subAction run];
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

/* 处理状态变化 */
- (void)handleChangedState:(AudioPlayer_State)state
{
    if(state == AudioPlayer_State_Stopped)
    {
        if(self.autoStartWhenStopped)
        {
            self.autoStartWhenStopped = NO;
            
            [self.subAction run];
        }
    }
}

@end
