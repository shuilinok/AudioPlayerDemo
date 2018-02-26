//
//  StateAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "StateAudioPlayerManager.h"
#import "AudioPlayerStoppedRequest.h"

@implementation StateAudioPlayerManager

- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self checkStartState:player callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [player start:^{
               
                callback();
            }];
        }
        else
        {
            callback();
        }
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self checkStopState:player callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [player stop:^{
                
            }];
        }
        else
        {
            callback();
        }
    }];
}

//返回错误码为0表示可以播放，否则不能
- (void)checkStartState:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        callback(nil);
    }
    else if(state == AudioPlayer_State_Stopping)//也是可以start的
    {
        AudioPlayerStoppedRequest *request = [[AudioPlayerStoppedRequest alloc] init];
        request.player = player;
        
        [request send:^{
            
            callback(nil);
        }];
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"已经在开始中"];
        callback(error);
    }
}


- (void)checkStopState:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        callback(nil);
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"已经在停止中"];
        callback(error);
    }
}

@end
