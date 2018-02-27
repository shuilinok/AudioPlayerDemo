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
    //根据musicID获取url
    //...
    
    if(request.bCancel)
    {
        return;
    }
    
    NSString *url;
    
    AudioFilePlayer *filePlayer = [[AudioFilePlayer alloc] init];
    filePlayer.url = url;
    self.filePlayer = filePlayer;
    
    [filePlayer start:^{
       
        [request finish];
    }];
}

- (void)impStop:(FCRequest *)request
{
    [self.filePlayer stop:^{
        
        [request finish];
    }];
}

@end

