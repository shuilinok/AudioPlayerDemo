//
//  AudioFilePlayer.h
//
//  Created by 税 on 3/28/17.

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@interface AudioFilePlayerParamContext : AudioPlayerParamContext

@property (strong, nonatomic) NSString *url;

@end

//声音文件播放器
@interface AudioFilePlayer : AudioPlayer

@property (readonly, strong, nonatomic) AudioFilePlayerParamContext *paramContext;

@end


