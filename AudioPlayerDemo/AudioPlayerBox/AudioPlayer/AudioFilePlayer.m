//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"


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

- (void)impStart:(FCRequest *)request
{
    AudioPlayer *player = self;
    
    player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    player.state = AudioPlayer_State_Started;
    
    
    [request finish];
}

- (void)impStop:(FCRequest *)request
{
    AudioPlayer *player = self;
    
    player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    NSLog(@"stopping");
    
    player.state = AudioPlayer_State_Stopped;
    
    [request finish];
}

@end


