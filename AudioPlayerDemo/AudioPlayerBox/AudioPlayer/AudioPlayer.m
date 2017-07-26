//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"

@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = AudioPlayer_State_None;
    }
    
    return self;
}

/* 开始播放 */
- (void)start
{
    //子类实现播放
}

/* 停止播放 */
- (void)stop
{
    //子类实现停止
}

@end


