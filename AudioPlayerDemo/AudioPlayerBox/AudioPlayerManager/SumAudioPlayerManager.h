//
//  SumAudioPlayerManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayerManager.h"
#import "StateAudioPlayerManager.h"
#import "ConditionAudioPlayerManager.h"
#import "SerialAudioPlayerManager.h"

@interface SumAudioPlayerManager : NSObject <AudioPlayerManager>

@property (readonly, strong, nonatomic) SerialAudioPlayerManager *serialManager;

@property (readonly, strong, nonatomic) StateAudioPlayerManager *stateManager;

@property (readonly, strong, nonatomic) ConditionAudioPlayerManager *conditionManager;

+ (instancetype)sharedInstance;

@end
