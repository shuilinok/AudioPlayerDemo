//
//  AudioPlayerState.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>

@class AudioPlayer;

//声音播放器状态
@interface AudioPlayerState : NSObject

@property (weak, nonatomic) AudioPlayer *player;

/* 开始播放 */
- (void)start;

/* 停止播放 */
- (void)stop;

@end


//播放器初始状态
@interface AudioPlayerNoneState : AudioPlayerState

@end

//播放器启动中状态
@interface AudioPlayerStartingState : AudioPlayerState

@end

//播放器已启动状态
@interface AudioPlayerStartedState : AudioPlayerState

@end

//播放器停止中状态
@interface AudioPlayerStoppingState : AudioPlayerState

@end

//播放器已停止状态
@interface AudioPlayerStoppedState : AudioPlayerState

@end




