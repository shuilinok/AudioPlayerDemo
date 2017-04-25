//
//  AudioPlayer.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>
#import "AudioPlayerState.h"

//声音播放器
@protocol AudioPlayer <NSObject>

@optional

/* 播放器状态 */
@property (readonly, strong, nonatomic) id<AudioPlayerState> state;

/* 开始播放 */
- (void)start;

/* 停止播放 */
- (void)stop;

@end




