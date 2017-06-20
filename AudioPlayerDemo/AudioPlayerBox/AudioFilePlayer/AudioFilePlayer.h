//
//  AudioFilePlayer.h
//
//  Created by 税 on 3/28/17.

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"


//声音文件播放器
@interface AudioFilePlayer : AudioPlayer

@property (readonly, strong, nonatomic) NSString *url;

- (instancetype)initWithUrl:(NSString *)url;

@end


@interface AudioFilePlayerStartPolicy : NSObject <AudioPlayerStartPolicy>

@property (weak, nonatomic) AudioFilePlayer *player;

@end


@interface AudioFilePlayerStopPolicy : NSObject <AudioPlayerStopPolicy>

@property (weak, nonatomic) AudioFilePlayer *player;

@end
