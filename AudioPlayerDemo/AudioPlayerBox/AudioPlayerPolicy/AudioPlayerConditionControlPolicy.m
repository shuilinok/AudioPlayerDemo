//
//  AudioPlayerConditionControlPolicy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerConditionControlPolicy.h"
#import "AudioPlayerControlPolicy_Private.h"

@implementation AudioPlayerConditionControlPolicy

- (void)start
{
    [self.player start];
}

- (void)stop
{
    [self.player stop];
}

- (void)handleChangedState:(AudioPlayer_State)state
{
    
}

@end
