//
//  MusicPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "MusicPlayer.h"

@implementation MusicPlayerStartRequest

- (void)execute
{
    MusicPlayer *player = self.player;
    
    player.state = AudioPlayer_State_Starting;
    
    //根据musicID获取url
    //...
    
    NSString *url;
    
    AudioFilePlayer *filePlayer = [[AudioFilePlayer alloc] init];
    filePlayer.url = url;
    player.filePlayer = filePlayer;
    
    [filePlayer start:^{
        
        [self finish];
    }];
}

@end


@implementation MusicPlayerStopRequest

- (void)execute
{
    MusicPlayer *player = self.player;
    
    [player.filePlayer stop:^{
        
        [self finish];
    }];
}
@end



@implementation MusicPlayer


- (FCRequest *)createStartRequest
{
    MusicPlayerStartRequest *request = [[MusicPlayerStartRequest alloc] init];
    request.player = self;
    
    return request;
}

- (FCRequest *)createStopRequest
{
    MusicPlayerStopRequest *request = [[MusicPlayerStopRequest alloc] init];
    request.player = self;
    
    return request;
}

@end

