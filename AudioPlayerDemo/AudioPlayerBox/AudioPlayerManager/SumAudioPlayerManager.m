//
//  SumAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "SumAudioPlayerManager.h"


@interface SumAudioPlayerManager ()

@property (strong, nonatomic) SerialAudioPlayerManager *serialManager;

@property (strong, nonatomic) StateAudioPlayerManager *stateManager;

@property (strong, nonatomic) ConditionAudioPlayerManager *conditionManager;

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
        SerialAudioPlayerManager *serialManager = [[SerialAudioPlayerManager alloc] init];
        
        ConditionAudioPlayerManager *conditionManager = [[ConditionAudioPlayerManager alloc] init];
        
        StateAudioPlayerManager *stateManager = [[StateAudioPlayerManager alloc] init];
        
        
        serialManager.delegate = conditionManager;
        conditionManager.delegate = stateManager;
        stateManager.delegate = [AudioPlayerManager sharedInstance];
        
        self.serialManager = serialManager;
        self.stateManager = stateManager;
        self.conditionManager = conditionManager;
        
    }
    return self;
}

- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self.serialManager startPlayer:player callback:^{
       
        callback();
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self.serialManager stopPlayer:player callback:^{
       
        callback();
    }];
}

@end
