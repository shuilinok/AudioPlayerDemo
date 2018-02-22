//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"


@implementation AudioPlayerCancelContext

@end



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

- (void)start:(AudioPlayerCancelContext *)context
{
    
}

- (void)stop
{
    
}

@end





