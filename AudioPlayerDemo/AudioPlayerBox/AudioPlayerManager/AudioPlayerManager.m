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

- (void)start:(AudioPlayer *)player request:(FCRequest *)request
{
    [player impStart:request];
}

- (void)stop:(AudioPlayer *)player request:(FCRequest *)request
{
    [player impStop:request];
}

@end
