//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"
#import "AudioPlayer_Private.h"

@implementation AudioPlayerParamContext

@end


@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = AudioPlayer_State_None;
        self.paramContext = [[AudioPlayerParamContext alloc] init];
    }
    
    return self;
}

- (void)start
{
    //...
}

- (void)stop
{
   //...
}

@end



