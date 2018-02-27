//
//  SumAudioPlayerManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayerManager.h"
#import "AudioPlayerStateChecker.h"
#import "AudioPlayerConditionChecker.h"

@interface SumAudioPlayerManager : NSObject <AudioPlayerManager>

@property (readonly, strong, nonatomic) AudioPlayerStateChecker *stateChecker;

@property (readonly, strong, nonatomic) AudioPlayerConditionChecker *conditionChecker;

+ (instancetype)sharedInstance;

@end
