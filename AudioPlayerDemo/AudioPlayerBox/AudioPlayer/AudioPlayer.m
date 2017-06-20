//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"


@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = [[AudioPlayerNoneState alloc] init];
    }
    
    return self;
}

- (void)setState:(AudioPlayerState *)state
{
    _state = state;
    
    state.player = self;
}

- (void)setStartPolicy:(id<AudioPlayerStartPolicy>)startPolicy
{
    _startPolicy = startPolicy;
    
    startPolicy.player = self;
}

- (void)setStopPolicy:(id<AudioPlayerStopPolicy>)stopPolicy
{
    _stopPolicy = stopPolicy;
    
    stopPolicy.player = self;
}

@end
