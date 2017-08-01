//
//  AudioPlayerStopAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerStopAction.h"

@implementation AudioPlayerStopAction

- (void)run
{
    self.player.startAction.isCancel = YES;
    
    AudioPlayer_State state = self.player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        [self.subAction run];
    }
    else
    {
        
    }
}

@end
