//
//  AudioFilePlayer.h
//
//  Created by 税 on 3/28/17.

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"
#import "AudioFilePlayerCheckStartAction.h"
#import "AudioFilePlayerStopAction.h"

//声音文件播放器
@interface AudioFilePlayer : AudioPlayer

@property (readonly, strong, nonatomic) NSString *url;

+ (instancetype)createWithUrl:(NSString *)url;

@end


