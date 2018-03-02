//
//  MusicPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "MusicPlayer.h"

@interface MusicPlayer ()

@property (strong, nonatomic) FCRequest *playRequest;

@end


@implementation MusicPlayer

- (void)start:(FCRequest *)request
{
    self.state = AudioPlayer_State_Starting;
    
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
    
    [filePlayer checkStart];
    
    [request finish];
}

//子类实现
- (void)start
{
    FCRequest *request = [[FCRequest alloc] init];
    self.playRequest = request;
    
    [request send:^{
        
        [self start:request];
        
    } callback:^{
        
    }];
}

- (void)stop
{
    [self.playRequest cancel];
    
    [self.filePlayer checkStop];
}

@end

