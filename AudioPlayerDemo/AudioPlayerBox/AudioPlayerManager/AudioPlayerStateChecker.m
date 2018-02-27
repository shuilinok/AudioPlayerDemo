//
//  AudioPlayerStateChecker.m
//  AudioPlayerDemo
//
//  Created by shuilin on 27/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerStateChecker.h"

@implementation AudioPlayerStateChecker

//返回错误码为0表示可以播放，否则不能
- (NSError *)checkStart:(AudioPlayer *)player
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        return nil;
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"已经在开始中"];
        return error;
    }
}


- (NSError *)checkStop:(AudioPlayer *)player
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        return nil;
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"已经在停止中"];
        return error;
    }
}

@end
