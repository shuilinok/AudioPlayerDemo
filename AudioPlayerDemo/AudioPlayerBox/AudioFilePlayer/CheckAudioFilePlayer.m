//
//  CheckAudioFilePlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 08/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "CheckAudioFilePlayer.h"


@implementation CheckAudioFilePlayer

- (void)start
{
    AudioPlayerChecker *checker = self.checker;
    
    [checker checkStart:self callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [super start];
        }
    }];
}

- (void)stop
{
    //如果启动操作还在进行，则取消
    //[[player.manager getStartRequest:player] cancel];
    
    AudioPlayerChecker *checker = self.checker;
    
    [checker checkStop:self callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [super stop];
        }
    }];
}

@end
