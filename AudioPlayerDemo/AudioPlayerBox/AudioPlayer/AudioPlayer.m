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
        self.controlPolicy = [[AudioPlayerControlPolicy alloc] init];//默认控制策略
    }
    
    return self;
}

- (void)setControlPolicy:(AudioPlayerControlPolicy *)controlPolicy
{
    //原来的控制策略失效
    _controlPolicy.player = nil;
    
    _controlPolicy = controlPolicy;
    
    _controlPolicy.player = self;
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


