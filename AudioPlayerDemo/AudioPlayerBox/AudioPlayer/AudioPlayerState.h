//
//  AudioPlayerState.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>

@protocol AudioPlayer;

//声音播放器状态
@protocol AudioPlayerState <NSObject>

//开始播放
- (void)start:(id<AudioPlayer>)player;

//停止播放
- (void)stop:(id<AudioPlayer>)player;

@end


//播放器初始状态
@interface AudioPlayerNoneState : NSObject <AudioPlayerState>

@end

//播放器启动中状态
@interface AudioPlayerStartingState : NSObject <AudioPlayerState>

@end

//播放器已启动状态
@interface AudioPlayerStartedState : NSObject <AudioPlayerState>

@end

//播放器停止中状态
@interface AudioPlayerStoppingState : NSObject <AudioPlayerState>

@end

//播放器已停止状态
@interface AudioPlayerStoppedState : NSObject <AudioPlayerState>

@end




