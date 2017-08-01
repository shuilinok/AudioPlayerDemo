//
//  AudioFilePlayerStopActionProxy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStopActionProxy.h"
#import "AudioPlayerStopAction.h"
#import "AudioFilePlayerStopAction.h"

@implementation AudioFilePlayerStopActionProxy

- (void)run
{
    AudioPlayerStopAction *stopAction = [[AudioPlayerStopAction alloc] initWithPlayer:self.player];
    AudioFilePlayerStopAction *action = [[AudioFilePlayerStopAction alloc] initWithPlayer:self.player];
    
    stopAction.subAction = action;
    
    self.subAction = stopAction;
    
    [stopAction run];
}

@end
