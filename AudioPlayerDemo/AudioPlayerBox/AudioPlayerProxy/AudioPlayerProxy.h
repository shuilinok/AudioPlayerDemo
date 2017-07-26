//
//  AudioPlayerProxy.h
//  AudioPlayerDemo
//
//  Created by shuilin on 26/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@interface AudioPlayerProxy : NSObject

- (instancetype)initWithPlayer:(AudioPlayer *)player;

/* 开始播放 */
- (void)start;

/* 停止播放 */
- (void)stop;

@end
