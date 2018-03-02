//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"
#import "AudioPlayerManager.h"
#import "AudioPlayerStartedRequest.h"
#import "AudioPlayerStoppedRequest.h"

@interface AudioPlayer ()

@end


@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = AudioPlayer_State_None;
    }
    
    return self;
}

//外部调用
- (void)checkStart
{
    if(self.manager == nil)
    {
        [self start];
    }
    else
    {
        [self.manager start:self];
    }
}

- (void)checkStop
{
    if(self.manager == nil)
    {
        [self stop];
    }
    else
    {
        [self.manager stop:self];
    }
}

- (void)waitStarted:(FCCallback)callback
{
    AudioPlayerStartedRequest *request = [[AudioPlayerStartedRequest alloc] init];
    request.player = self;
    
    [request send:^{
       
        callback();
    }];
}

- (void)waitStopped:(FCCallback)callback
{
    AudioPlayerStoppedRequest *request = [[AudioPlayerStoppedRequest alloc] init];
    request.player = self;
    
    [request send:^{
       
        callback();
    }];
}

//子类实现
- (void)start
{
    abort();
}

- (void)stop
{
    abort();
}

@end





