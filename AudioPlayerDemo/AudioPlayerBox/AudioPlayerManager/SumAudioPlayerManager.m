//
//  SumAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "SumAudioPlayerManager.h"


@interface SumAudioPlayerManager () <AudioPlayerConditionCheckerDelegate>

@property (strong, nonatomic) AudioPlayerStateChecker *stateChecker;

@property (strong, nonatomic) AudioPlayerConditionChecker *conditionChecker;

@property (strong, nonatomic) AudioPlayer *player;

@end


@implementation SumAudioPlayerManager

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        AudioPlayerConditionChecker *conditionChecker = [[AudioPlayerConditionChecker alloc] init];
        conditionChecker.delegate = self;
        
        AudioPlayerStateChecker *stateChecker = [[AudioPlayerStateChecker alloc] init];
        
        self.conditionChecker = conditionChecker;
        self.stateChecker = stateChecker;
        
    }
    return self;
}

- (void)checkStart:(AudioPlayer *)player request:(FCRequest *)request
{
    self.player = player;
    
    //检查状态
    NSError *error = [self.stateChecker checkStart:player];
    
    if(error.code == noErr)
    {
        player.state = AudioPlayer_State_Starting;
        
        //检查环境
        [self.conditionChecker checkStart:player callback:^(NSError *error) {
            
            if(request.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                [player impStart:request];
            }
            else
            {
                request.code = error.code;
                [request finish];
            }
        }];
    }
    else
    {
        request.code = error.code;
        [request finish];
    }
}

- (void)start:(AudioPlayer *)player request:(FCRequest *)request
{
    if(self.player == nil)
    {
        [self checkStart:player request:request];
    }
    else
    {
        if(player == self.player)
        {
            [self checkStart:player request:request];
        }
        else//换了
        {
            //先把原来的停止
            [self.player stop:^{
                
                [self checkStart:player request:request];
            }];
        }
        
    }
}

- (void)stop:(AudioPlayer *)player request:(FCRequest *)request
{
    //检查状态
    NSError *error = [self.stateChecker checkStop:player];
    
    if(error.code == noErr)
    {
        player.state = AudioPlayer_State_Stopping;
        
        [player impStop:request];
    }
    else
    {
        request.code = error.code;
        [request finish];
    }
}


- (void)shouldStart
{
    [self.player start:nil];
}

- (void)shouldStop
{
    [self.player stop:nil];
}

@end
