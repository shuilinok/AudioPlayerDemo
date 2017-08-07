//
//  AudioPlayerCheckStopAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 07/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerCheckStopAction.h"
#import "AudioPlayer.h"

@implementation AudioPlayerCheckStopAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    AudioPlayer *player = context;
    
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        [self callbackError:nil];
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"状态不对，不能停止"];
        [self callbackError:error];
    }
}

@end
