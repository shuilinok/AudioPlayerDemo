//
//  AudioPlayerChecker.m
//  AudioPlayerDemo
//
//  Created by shuilin on 08/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerChecker.h"
#import "AudioPlayer.h"
#import "FCRequest.h"


//等待停止请求
@interface AudioPlayerStoppedRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@property (assign, nonatomic) BOOL observing;

@end


@implementation AudioPlayerStoppedRequest

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
    if(state == AudioPlayer_State_Stopped)
    {
        self.code = noErr;
        [self finish];
    }
}

- (void)execute
{
    if(!self.observing)
    {
        [self beginObserve];
        self.observing = YES;
    }
}

@end


//
@implementation AudioPlayerChecker

- (void)checkStartState:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_None || state == AudioPlayer_State_Stopped)
    {
        callback(nil);
    }
    else if(state == AudioPlayer_State_Stopping)//也是可以start的
    {
        AudioPlayerStoppedRequest *request = [[AudioPlayerStoppedRequest alloc] init];
        request.player = player;
        
        [request send:^{
            
            callback(nil);
        }];
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"状态不对，不能开始"];
        callback(error);
    }
}

- (void)checkStartStateCondition:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    [self checkStartState:player callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            //检查网络播放设置和当前网络环境
            NSError *error = [NSError errorWithCode:0 xtmsg:@"Check OK"];
            
            callback(error);
        }
        else
        {
            callback(error);
        }
    }];
}

- (void)checkStopState:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    AudioPlayer_State state = player.state;
    
    if(state == AudioPlayer_State_Starting || state == AudioPlayer_State_Started)
    {
        callback(nil);
    }
    else
    {
        NSError *error = [NSError errorWithCode:1 xtmsg:@"状态不对，不能停止"];
        callback(error);
    }
}

@end



