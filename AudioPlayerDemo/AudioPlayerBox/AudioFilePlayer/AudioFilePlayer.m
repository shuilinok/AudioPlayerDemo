//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@interface AudioFilePlayer ()

/* 播放器状态 */
@property (strong, nonatomic) id<AudioPlayerState> state;

@property (strong, nonatomic) NSString *url;

@end


@implementation AudioFilePlayer

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if(self)
    {
        self.state = [[AudioPlayerNoneState alloc] init];
        self.url = url;
    }
    
    return self;
}

/* 开始播放 */
- (void)start
{
    self.state = [[AudioPlayerStartingState alloc] init];
    
    //启动播放操作
    //...
    
    self.state = [[AudioPlayerStartedState alloc] init];
}

/* 停止播放 */
- (void)stop
{
    self.state = [[AudioPlayerStoppingState alloc] init];
    
    //停止播放操作
    //...
    
    self.state = [[AudioPlayerStoppedState alloc] init];
}

@end
