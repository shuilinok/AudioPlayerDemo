//
//  CheckAudioFilePlayer.h
//  AudioPlayerDemo
//
//  Created by shuilin on 09/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioFilePlayer.h"

@interface CheckAudioFilePlayer : AudioFilePlayer

//启动模式，0直接启动，1检查状态启动，2检查状态和环境启动
@property (assign, nonatomic) NSInteger startMode;

- (void)start;

@end
