//
//  SerialAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "SerialAudioPlayerManager.h"


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
    FCRequest *request = [[FCRequest alloc] init];
    request.manager = self.requestManager;
    
    [request send:^{
        
        [self.delegate startPlayer:player callback:^{
           
            [request finish];
        }];
        
    } callback:^{
        
        callback();
    }];
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    //如果启动操作还在进行，则取消
    [player cancelStart];
    
    FCRequest *request = [[FCRequest alloc] init];
    request.manager = self.requestManager;
    
    [request send:^{
        
        [self.delegate stopPlayer:player callback:^{
            
            [request finish];
        }];
        
    } callback:^{
        
        callback();
    }];
}
@end
