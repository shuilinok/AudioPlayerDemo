//
//  AudioFilePlayer.h
//
//  Created by 税 on 3/28/17.

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"


//声音文件播放器
@interface AudioFilePlayer : AudioPlayer

@property (strong, nonatomic) NSString *url;

@end



@interface AudioFilePlayerStartRequest : FCRequest

@property (weak, nonatomic) AudioFilePlayer *player;

@end



@interface AudioFilePlayerStopRequest : FCRequest

@property (weak, nonatomic) AudioFilePlayer *player;

@end


