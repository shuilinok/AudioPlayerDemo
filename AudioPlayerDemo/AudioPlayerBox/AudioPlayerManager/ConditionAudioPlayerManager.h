//
//  ConditionAudioPlayerManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerManager.h"

@interface ConditionAudioPlayerManager : NSObject <AudioPlayerManager>

@property (weak, nonatomic) id<AudioPlayerManager> delegate;

@end
