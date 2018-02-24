//
//  SerialAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "SerialAudioPlayerManager.h"


@interface SerialAudioPlayerManagerStartRequest : FCRequest

@property (weak, nonatomic) id<AudioPlayerManager> target;

@property (weak, nonatomic) AudioPlayer *player;

@end

@interface SerialAudioPlayerManagerStopRequest : FCRequest

@property (weak, nonatomic) id<AudioPlayerManager> target;

@property (weak, nonatomic) AudioPlayer *player;

@end


@implementation SerialAudioPlayerManagerStartRequest

- (void)execute
{
    [self.target startPlayer:self.player callback:^{
        
        [self finish];
    }];
}
@end

@implementation SerialAudioPlayerManagerStopRequest

- (void)execute
{
    [self.target stopPlayer:self.player callback:^{
       
        [self finish];
    }];
}
@end


@interface SerialAudioPlayerManager ()

@property (strong, nonatomic) FCConcurrencyRequestManager *requestManager;

@end

@implementation SerialAudioPlayerManager

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        FCConcurrencyRequestManager *manager = [[FCConcurrencyRequestManager alloc] init];
        manager.maxCount = 1;
        self.requestManager = manager;
    }
    
    return self;
}

- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    SerialAudioPlayerManagerStartRequest *request = [[SerialAudioPlayerManagerStartRequest alloc] init];
    request.target = self.delegate;
    request.player = player;
    
    request.manager = self.requestManager;
    
    [request send:^{
       
        callback();
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    SerialAudioPlayerManagerStopRequest *request = [[SerialAudioPlayerManagerStopRequest alloc] init];
    request.target = self.delegate;
    request.player = player;
    
    request.manager = self.requestManager;
    
    [request send:^{
        
        callback();
    }];
}
@end
