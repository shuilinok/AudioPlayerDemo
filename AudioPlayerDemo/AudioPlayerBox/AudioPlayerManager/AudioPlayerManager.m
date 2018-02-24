//
//  AudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerManager.h"


@implementation AudioPlayerManager

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [player.startRequest cancel];
    
    FCRequest *request = [player createStartRequest];
    
    player.startRequest = request;
    
    [request send:^{
        
        if(callback)
        {
            callback();
        }
        
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    //如果启动操作还在进行，则取消
    [player.startRequest cancel];
    
    FCRequest *request = [player createStopRequest];
    
    [request send:^{
        
        if(callback)
        {
            callback();
        }
    }];
}


@end
