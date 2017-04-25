//
//  AudioPlayerState.m
//  Created by 税 on 3/28/17.


#import "AudioPlayerState.h"
#import "AudioPlayer.h"

//播放器初始状态
@implementation AudioPlayerNoneState

//开始播放
- (void)start:(id<AudioPlayer>)player
{
    //启动
    [player start];
    
}

//停止播放
- (void)stop:(id<AudioPlayer>)player
{
    NSLog(@"播放器初始态，不需要停止");
}

@end


//播放器启动中状态
@implementation AudioPlayerStartingState

//开始播放
- (void)start:(id<AudioPlayer>)player
{
    NSLog(@"正在启动中，不能重复启动");
}

//停止播放
- (void)stop:(id<AudioPlayer>)player
{
    //停止
    [player stop];
}

@end


//播放器已启动状态
@implementation AudioPlayerStartedState

//开始播放
- (void)start:(id<AudioPlayer>)player
{
    NSLog(@"已经启动了，不能重复启动");
}

//停止播放
- (void)stop:(id<AudioPlayer>)player
{
    //停止
    [player stop];
}

@end


//播放器停止中状态
@implementation AudioPlayerStoppingState

//开始播放
- (void)start:(id<AudioPlayer>)player
{
    NSLog(@"正在停止中，不能启动");
}

//停止播放
- (void)stop:(id<AudioPlayer>)player
{
    NSLog(@"正在停止中，不能重复停止");
}

@end


//播放器已停止状态
@implementation AudioPlayerStoppedState

//开始播放
- (void)start:(id<AudioPlayer>)player
{
    //启动
    [player start];
}

//停止播放
- (void)stop:(id<AudioPlayer>)player
{
    NSLog(@"已经停止了，不能重复停止");
}

@end








