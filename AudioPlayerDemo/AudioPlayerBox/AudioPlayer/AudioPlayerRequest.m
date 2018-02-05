//
//  AudioPlayerRequest.m
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerRequest.h"
#import "AudioPlayer.h"

@implementation AudioPlayerStartRequest

- (void)execute
{
    NSLog(@"子类实现具体的播放功能");
}

@end


@interface AudioPlayerStartCheckStateRequest ()

//停止后自动又开始
@property (assign, nonatomic) BOOL autoStartWhenStopped;

@end


@implementation AudioPlayerStartCheckStateRequest

- (void)dealloc
{
    self.player = nil;
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
            
            self.code = noErr;
            [self finish];
        }
    }
}

- (void)execute
{
    AudioPlayer_State state = self.player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        self.code = noErr;
        [self finish];
    }
    else if(state == AudioPlayer_State_Stopping)
    {
        //也是可以start的
        self.autoStartWhenStopped = YES;
    }
    else
    {
        self.code = 1;
        self.msg = @"状态不对，不能开始";
        [self finish];
    }
}

@end


@implementation AudioPlayerStartCheckConditionRequest

- (void)execute
{
    //检查网络播放设置和当前网络环境
    self.code = noErr;
    self.msg = @"Check OK";
    
    [self finish];
}

@end


@implementation AudioPlayerCheckStateCondtionStartRequest

- (void)execute
{
    [self.checkStateRequest send:^{
       
        if(self.bCancel)
        {
            return;
        }
        
        if(self.checkStateRequest.code == noErr)
        {
            [self.checkConditionRequest send:^{
               
                if(self.bCancel)
                {
                    return;
                }
                
                if(self.checkConditionRequest.code == noErr)
                {
                    [self.startRequest send:^{
                       
                        if(self.bCancel)
                        {
                            return;
                        }
                        
                        self.code = self.startRequest.code;
                        [self finish];
                    }];
                }
                else
                {
                    self.code = self.checkConditionRequest.code;
                    [self finish];
                }
            }];
        }
        else
        {
            self.code = self.checkStateRequest.code;
            [self finish];
        }
    }];
}

@end


@implementation AudioPlayerStopRequest

- (void)execute
{
    NSLog(@"子类实现具体的播放功能");
}

@end


@implementation AudioPlayerStopCheckStateRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        self.code = noErr;
        [self finish];
    }
    else
    {
        self.code = 1;
        self.msg = @"状态不对，不能停止";
        [self finish];
    }
}

@end


@implementation AudioPlayerCheckStateStopRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    //如果启动操作还在进行，则取消
    [player.startRequest cancel];
    
    [self.checkStateRequest send:^{
        
        if(self.bCancel)
        {
            return;
        }
        
        if(self.checkStateRequest.code == noErr)
        {
            [self.stopRequest send:^{
               
                if(self.bCancel)
                {
                    return;
                }
                
                self.code = self.stopRequest.code;
                [self finish];
            }];
        }
        else
        {
            self.code = self.checkStateRequest.code;
            [self finish];
        }
    }];
}
@end
