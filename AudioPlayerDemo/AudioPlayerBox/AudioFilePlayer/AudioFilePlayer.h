//
//  AudioFilePlayer.h
//
//  Created by 税 on 3/28/17.

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

//声音文件播放器
@protocol AudioFilePlayer <AudioPlayer>

@optional

@property (readonly, strong, nonatomic) NSString *url;

@end



@interface AudioFilePlayer : NSObject <AudioFilePlayer>

- (instancetype)initWithUrl:(NSString *)url;

@end
