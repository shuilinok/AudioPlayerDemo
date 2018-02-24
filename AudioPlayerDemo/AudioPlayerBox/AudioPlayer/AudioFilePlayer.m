//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@implementation AudioFilePlayerStartRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    player.state = AudioPlayer_State_Started;
    
    [self finish];
}

@end



@implementation AudioFilePlayerStopRequest

- (void)execute
{
    AudioPlayer *player = self.player;
    
    player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    NSLog(@"stopping");
    
    player.state = AudioPlayer_State_Stopped;
    
    [self finish];
}

@end


@interface AudioFilePlayer ()

@end

@implementation AudioFilePlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

- (FCRequest *)createStartRequest
{
    AudioFilePlayerStartRequest *request = [[AudioFilePlayerStartRequest alloc] init];
    request.player = self;
    
    return request;
}

- (FCRequest *)createStopRequest
{
    AudioFilePlayerStopRequest *request = [[AudioFilePlayerStopRequest alloc] init];
    request.player = self;
    
    return request;
}

@end



