//
//  AudioPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 20/06/2017.
//  Copyright . All rights reserved.
//

#import "AudioPlayer.h"
#import "FCRequest.h"
#import "AudioPlayerManager.h"

@interface AudioPlayer ()

@property (strong, nonatomic) FCRequest *startRequest;

@property (strong, nonatomic) FCRequest *stopRequest;

@end


@implementation AudioPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.state = AudioPlayer_State_None;
    }
    
    return self;
}

- (void)start:(FCCallback)callback
{
    //取消干净
    [self.startRequest cancel];
    [self.stopRequest cancel];
    
    FCRequest *request = [[FCRequest alloc] init];
    self.startRequest = request;
    
    [request send:^{
        
        if(self.manager == nil)
        {
            [self impStart:request];
        }
        else
        {
            [self.manager start:self request:request];
        }

    } callback:^{
        
        //启动不成功
        if(request.code != 0 && request.code != 1)
        {
            self.state = AudioPlayer_State_Stopped;
        }
    
        if(callback)
        {
            callback();
        }
        
    }];
}

- (void)stop:(FCCallback)callback
{
    //取消干净
    [self.stopRequest cancel];
    [self.startRequest cancel];
    
    FCRequest *request = [[FCRequest alloc] init];
    self.stopRequest = request;
    
    [request send:^{
        
        if(self.manager == nil)
        {
            [self impStop:request];
        }
        else
        {
            [self.manager stop:self request:request];
        }
        
    } callback:^{
        
        //没有停止不成功
        
        if(callback)
        {
            callback();
        }
    }];
}

- (void)impStart:(FCRequest *)request
{
    abort();
}

- (void)impStop:(FCRequest *)request
{
    abort();
}

@end





