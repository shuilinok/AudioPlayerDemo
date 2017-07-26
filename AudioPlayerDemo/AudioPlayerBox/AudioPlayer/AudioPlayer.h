//
//  AudioPlayer.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>
#import "AudioPlayerDefine.h"


@class AudioPlayerProxy;

//声音播放器
@interface AudioPlayer : NSObject

/* 播放器状态，KVO */
@property (assign, nonatomic) AudioPlayer_State state;

/* 错误发生，KVO */
@property (strong, nonatomic) NSError *error;

/* 播放器控制代理 */
@property (strong, nonatomic) AudioPlayerProxy *proxy;

/* 开始播放 */
- (void)start;

/* 停止播放 */
- (void)stop;

@end




