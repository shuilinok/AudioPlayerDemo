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

@property (strong, nonatomic) ConditionAudioPlayerManager *conditionManager;

@property (strong, nonatomic) StateAudioPlayerManager *stateManager;

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
        
        conditionManager.delegate = serialManager;
        serialManager.delegate = stateManager;
        
        self.serialManager = serialManager;
        self.conditionManager = conditionManager;
        self.stateManager = stateManager;
    }
    return self;
}

- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self.conditionManager startPlayer:player callback:^{
       
        callback();
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self.conditionManager stopPlayer:player callback:^{
       
        callback();
    }];
}

@end
