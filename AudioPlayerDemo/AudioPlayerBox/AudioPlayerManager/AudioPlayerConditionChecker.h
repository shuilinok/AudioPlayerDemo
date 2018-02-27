//
//  AudioPlayerConditionChecker.h
//  AudioPlayerDemo
//
//  Created by shuilin on 27/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"


@protocol AudioPlayerConditionCheckerDelegate <NSObject>

- (void)shouldStart;

- (void)shouldStop;

@end


@interface AudioPlayerConditionChecker : NSObject

//返回错误码为0表示可以播放，否则不能
- (void)checkStart:(AudioPlayer *)player callback:(FCResultCallback)callback;

@property (weak, nonatomic) id<AudioPlayerConditionCheckerDelegate> delegate;

@end
