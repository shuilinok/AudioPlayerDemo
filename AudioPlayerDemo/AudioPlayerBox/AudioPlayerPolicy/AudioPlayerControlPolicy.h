//
//  AudioPlayerControlPolicy.h
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioPlayer;

//状态控制策略
@interface AudioPlayerControlPolicy : NSObject

//观察播放器
@property (weak, nonatomic) AudioPlayer *player;

- (void)start;

- (void)stop;

@end
