//
//  AudioPlayerStateChecker.h
//  AudioPlayerDemo
//
//  Created by shuilin on 27/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@interface AudioPlayerStateChecker : NSObject

//返回错误码为0表示可以播放，否则不能
- (NSError *)checkStart:(AudioPlayer *)player;

- (NSError *)checkStop:(AudioPlayer *)player;

@end
