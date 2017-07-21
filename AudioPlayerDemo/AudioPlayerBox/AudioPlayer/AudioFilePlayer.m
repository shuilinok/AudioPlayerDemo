//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@interface AudioFilePlayer ()

@property (strong, nonatomic) NSString *url;

@end


@implementation AudioFilePlayer

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if(self)
    {
        self.url = url;
    }
    
    return self;
}

- (void)start
{
    self.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    
    self.state = AudioPlayer_State_Started;
}

- (void)stop
{
    self.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    
    self.state = AudioPlayer_State_Stopped;
}
@end



