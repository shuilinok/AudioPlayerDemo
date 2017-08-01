//
//  AudioFilePlayerStartActionProxy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStartActionProxy.h"
#import "AudioPlayerStartAction.h"
#import "AudioPlayerCheckConditionAction.h"
#import "AudioFilePlayerStartAction.h"

@interface AudioFilePlayerStartActionProxy ()

@end

@implementation AudioFilePlayerStartActionProxy

- (void)run
{
    AudioPlayerStartAction *startAction = [[AudioPlayerStartAction alloc] initWithPlayer:self.player];
    AudioPlayerCheckConditionAction *checkAction = [[AudioPlayerCheckConditionAction alloc] initWithPlayer:self.player];
    AudioFilePlayerStartAction *action = [[AudioFilePlayerStartAction alloc] initWithPlayer:self.player];
    
    startAction.subAction = checkAction;
    checkAction.subAction = action;
    
    self.subAction = startAction;
    
    [startAction run];
}

@end
