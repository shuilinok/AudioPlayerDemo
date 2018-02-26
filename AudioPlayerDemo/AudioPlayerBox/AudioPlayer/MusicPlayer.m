//
//  MusicPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "MusicPlayer.h"


@implementation MusicPlayer

- (void)impStart:(FCRequest *)request
{
    MusicPlayer *player = self;
    
    player.state = AudioPlayer_State_Starting;
    
    //根据musicID获取url
    //...
    
    NSString *url;
    
    AudioFilePlayer *filePlayer = [[AudioFilePlayer alloc] init];
    filePlayer.url = url;
    player.filePlayer = filePlayer;
    
    [filePlayer start:^{
        
        [request finish];
    }];
}

- (void)impStop:(FCRequest *)request
{
    MusicPlayer *player = self;
    
    [player.filePlayer stop:^{
        
        [request finish];
    }];
}

@end

