//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"

@interface AudioPlayer ()

@property (strong, nonatomic) MCAction *startAction;

@property (strong, nonatomic) MCAction *stopAction;

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

- (void)start
{
    self.startAction = [MCActionCreator createAction:self.paramContext.startActionName];
    
    [self.startAction run:self callback:^(NSError *error) {
        
    }];
}

- (void)stop
{
    self.stopAction = [MCActionCreator createAction:self.paramContext.stopActionName];
    
    [self.stopAction run:self callback:^(NSError *error) {
        
    }];
}

@end


@implementation AudioPlayerParamContext


@end
