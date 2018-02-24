//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"
#import "AudioPlayerManager.h"

@interface AudioPlayer ()

@end


@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = AudioPlayer_State_None;
        self.manager = [AudioPlayerManager sharedInstance];
    }
    
    return self;
}

- (void)start:(FCCallback)callback
{
    [self.manager startPlayer:self callback:^{
       
        if(callback)
        {
            callback();
        }
        
    }];
}

- (void)stop:(FCCallback)callback
{
    [self.manager stopPlayer:self callback:^{
       
        if(callback)
        {
            callback();
        }
    }];
}


//子类实现
- (FCRequest *)createStartRequest
{
    abort();
}

- (FCRequest *)createStopRequest
{
    abort();
}

@end





