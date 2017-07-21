//
//  AudioPlayerControlPolicy.m
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerControlPolicy.h"
#import "AudioPlayerControlPolicy_Private.h"

@implementation AudioPlayerControlPolicy

- (void)dealloc
{
    self.player = nil;
}

- (void)start
{
    //子类实现
}

- (void)stop
{
    //子类实现
}

- (void)handleChangedState:(AudioPlayer_State)state
{
    //子类实现
}

- (void)setPlayer:(AudioPlayer *)player
{
    [self endObserve];
    
    _player = player;
    
    [self beginObserve];
}

//开始观察
- (void)beginObserve
{
    NSObject *temp = _player;
    [temp addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
}

//结束观察
- (void)endObserve
{
    NSObject *temp = _player;
    [temp removeObserver:self forKeyPath:@"state" context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    AudioPlayer *player = object;
    if(player == self.player)
    {
        //观察到本下载器对象此属性改变
        if([keyPath isEqualToString:@"state"])
        {
            [self handleChangedState:player.state];
        }
    }
}

@end
