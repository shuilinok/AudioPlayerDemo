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

- (void)prepareStart:(FCCallback)callback
{
    if(self.manager == nil)
    {
        [self start:^{
            
            if(callback)
            {
                callback();
            }
        }];
    }
    else
    {
        [self.manager startPlayer:self callback:^{
            
            if(callback)
            {
                callback();
            }
        }];
    }
}

- (void)prepareStop:(FCCallback)callback
{
    if(self.manager == nil)
    {
        [self stop:^{
           
            if(callback)
            {
                callback();
            }
        }];
    }
    else
    {
        [self.manager stopPlayer:self callback:^{
            
            if(callback)
            {
                callback();
            }
        }];
    }
}

- (void)start:(FCCallback)callback
{
    FCRequest *request = [[FCRequest alloc] init];
    self.startRequest = request;
    
    [request send:^{
        
        [self impStart:request];
        
    } callback:^{
        
        callback();
    }];
}

- (void)stop:(FCCallback)callback
{
    FCRequest *request = [[FCRequest alloc] init];
    self.stopRequest = request;
    
    [request send:^{
        
        [self impStop:request];
        
    } callback:^{
        
        callback();
    }];
}

- (void)cancelStart
{
    [self.startRequest cancel];
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





