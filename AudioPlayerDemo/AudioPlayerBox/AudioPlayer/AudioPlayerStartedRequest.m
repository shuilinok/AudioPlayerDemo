//
//  AudioPlayerStartedRequest.m
//  AudioPlayerDemo
//
//  Created by shuilin on 26/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerStartedRequest.h"
#import "AudioPlayer.h"

//等待停止请求
@interface AudioPlayerStartedRequest ()

@property (assign, nonatomic) BOOL observing;

@end


@implementation AudioPlayerStartedRequest

- (void)dealloc
{
    if(self.observing)
    {
        [self endObserve];
        self.observing = NO;
    }
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

/* 处理状态变化 */
- (void)handleChangedState:(AudioPlayer_State)state
{
    if(state == AudioPlayer_State_Started)
    {
        self.code = noErr;
        [self finish];
    }
}

- (void)send:(FCCallback)callback
{
    [self send:^{
        
        AudioPlayer_State state = self.player.state;
        
        if(state == AudioPlayer_State_Started)//已经是启动的
        {
            self.code = noErr;
            [self finish];
            return;
        }
        
        if(!self.observing)
        {
            [self beginObserve];
            self.observing = YES;
        }
        
    } callback:^{
        
        callback();
    }];
}

@end
