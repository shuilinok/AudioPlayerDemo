//
//  NormalAudioPlayer.h
//  Created by 税 on 4/21/17.


#import <Foundation/Foundation.h>
#import "NSProxyExtention.h"
#import "AudioPlayer.h"

//防止播放状态紊乱，代理
@interface NormalAudioPlayer : NSProxy <NSProxyExtention,AudioPlayer>

+ (instancetype)createWithPlayer:(id<AudioPlayer>)player;

@end
