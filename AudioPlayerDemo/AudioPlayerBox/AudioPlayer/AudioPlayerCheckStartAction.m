//
//  AudioPlayerCheckStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 07/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerCheckStartAction.h"
#import "AudioPlayer.h"

@interface AudioPlayerCheckStartAction ()

@property (weak, nonatomic) AudioPlayer *player;

//停止后自动又开始
@property (assign, nonatomic) BOOL autoStartWhenStopped;

@end


@implementation AudioPlayerCheckStartAction

- (void)dealloc
{
    self.player = nil;
}


- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    self.player = context;
    
    AudioPlayer_State state = self.player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        [self callbackError:nil];
    }
    else if(state == AudioPlayer_State_Stopping)
    {
        //也是可以start的
        self.autoStartWhenStopped = YES;
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"状态不对，不能开始"];
        [self callbackError:error];
    }
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

/* 处理状态变化 */
- (void)handleChangedState:(AudioPlayer_State)state
{
    if(state == AudioPlayer_State_Stopped)
    {
        if(self.autoStartWhenStopped)
        {
            self.autoStartWhenStopped = NO;
            
            [self callbackError:nil];
        }
    }
}

@end
