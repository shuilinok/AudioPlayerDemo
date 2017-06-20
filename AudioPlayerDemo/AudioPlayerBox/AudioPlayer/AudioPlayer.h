//
//  AudioPlayer.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>
#import "AudioPlayerState.h"

@class AudioPlayer;

@protocol AudioPlayerStartPolicy <NSObject>

@property (weak, nonatomic) AudioPlayer *player;

/* 开始播放 */
- (void)start;

@end


@protocol AudioPlayerStopPolicy <NSObject>

@property (weak, nonatomic) AudioPlayer *player;

/* 停止播放 */
- (void)stop;

@end


//声音播放器
@interface AudioPlayer : NSObject

/* 播放器状态 */
@property (strong, nonatomic) AudioPlayerState *state;

/* 错误发生 */
@property (strong, nonatomic) NSError *error;

/* 播放器启动策略 */
@property (strong, nonatomic) id<AudioPlayerStartPolicy> startPolicy;

/* 播放器停止策略 */
@property (strong, nonatomic) id<AudioPlayerStopPolicy> stopPolicy;

@end




