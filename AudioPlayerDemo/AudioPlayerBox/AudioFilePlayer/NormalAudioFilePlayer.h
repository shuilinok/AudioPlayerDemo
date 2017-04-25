//
//  NormalAudioFilePlayer.h
//
//  Created by 税 on 4/21/17.


#import <Foundation/Foundation.h>
#import "NSProxyExtention.h"
#import "AudioFilePlayer.h"


//整合播放器业务和功能，代理
@interface NormalAudioFilePlayer : NSProxy <NSProxyExtention,AudioFilePlayer>

+ (instancetype)createWithUrl:(NSString *)url;

@end
