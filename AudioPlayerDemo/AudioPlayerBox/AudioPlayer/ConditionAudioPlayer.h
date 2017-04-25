//
//  ConditionAudioPlayer.h

//  Created by 税 on 4/21/17.


#import <Foundation/Foundation.h>
#import "NSProxyExtention.h"
#import "AudioPlayer.h"

//条件检查，代理
@interface ConditionAudioPlayer : NSProxy <NSProxyExtention, AudioPlayer>

+ (instancetype)createWithPlayer:(id<AudioPlayer>)player;

@end
