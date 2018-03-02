//
//  AudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerManager.h"

@interface AudioPlayerManager ()

@end


@implementation AudioPlayerManager

- (void)start:(AudioPlayer *)player
{
    [player start];
}

- (void)stop:(AudioPlayer *)player
{
    [player stop];
}

@end
