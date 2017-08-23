//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"

@implementation AudioPlayerParamContext

- (MCAction *)createStartAction
{
    abort();
    return nil;
}

- (MCAction *)createStopAction
{
    abort();
    return nil;
}

@end



@interface AudioPlayer ()

@property (strong, nonatomic) MCAction *startAction;

@property (strong, nonatomic) MCAction *stopAction;

@property (strong, nonatomic) AudioPlayerParamContext *paramContext;

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
    self.startAction = [self.paramContext createStartAction];
    
    [self.startAction run:self callback:^(NSError *error) {
        
    }];
}

- (void)stop
{
    self.stopAction = [self.paramContext createStopAction];
    
    [self.stopAction run:self callback:^(NSError *error) {
        
    }];
}

- (void)cancelStart
{
    [self.startAction cancel:0];
}

- (void)cancelStop
{
    [self.stopAction cancel:0];
}

@end



