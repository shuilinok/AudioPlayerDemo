//
//  AudioPlayerAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 28/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerAction.h"

@interface AudioPlayerAction ()

@property (weak, nonatomic) AudioPlayer *player;

@end


@implementation AudioPlayerAction

- (instancetype)initWithPlayer:(AudioPlayer *)player
{
    self = [super init];
    if(self)
    {
        self.player = player;
    }
    
    return self;
}

- (void)dealloc
{
    self.player = nil;
}

- (void)run
{
    
}

/* 处理状态变化 */
- (void)handleChangedState:(AudioPlayer_State)state
{
    
}

- (void)setPlayer:(AudioPlayer *)player
{
    //移除旧的观察
    [self endObserve];
    
    _player = player;
    
    //增加新的观察
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
