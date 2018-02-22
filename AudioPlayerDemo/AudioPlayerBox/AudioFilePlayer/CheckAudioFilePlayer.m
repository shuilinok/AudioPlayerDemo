//
//  CheckAudioFilePlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 09/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "CheckAudioFilePlayer.h"
#import "AudioPlayerChecker.h"


@implementation CheckAudioFilePlayerStartRequest

- (void)execute
{
    CheckAudioFilePlayer *player = self.player;
    
    AudioPlayerChecker *checker = [[AudioPlayerChecker alloc] init];
    
    
    if(player.startMode == 0)
    {
        AudioFilePlayerStartRequest *request = [[AudioFilePlayerStartRequest alloc] init];
        request.player = player;
        
        self.subRequest = request;
        
        [request send:^{
            
        }];
    }
    else if(player.startMode == 1)
    {
        [checker checkStartState:player callback:^(NSError *error) {
            
            if(self.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                AudioFilePlayerStartRequest *request = [[AudioFilePlayerStartRequest alloc] init];
                request.player = player;
                
                self.subRequest = request;
                
                [request send:^{
                    
                }];
            }
        }];
    }
    else if(player.startMode == 2)
    {
        [checker checkStartStateCondition:player callback:^(NSError *error) {
            
            if(self.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                AudioFilePlayerStartRequest *request = [[AudioFilePlayerStartRequest alloc] init];
                request.player = player;
                
                self.subRequest = request;
                
                [request send:^{
                    
                }];
            }
        }];
    }
    else
    {
        NSLog(@"不支持的启动模式:%ld",player.startMode);
    }
}

- (void)cancel
{
    [super cancel];
    
    [self.subRequest cancel];
}
@end


@implementation CheckAudioFilePlayerStopRequest

- (void)execute
{
    CheckAudioFilePlayer *player = self.player;

    AudioPlayerChecker *checker = [[AudioPlayerChecker alloc] init];
    
    [checker checkStopState:player callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            AudioFilePlayerStopRequest *request = [[AudioFilePlayerStopRequest alloc] init];
            request.player = player;
            
            [request send:^{
                
            }];
        }
    }];
}

@end


@interface CheckAudioFilePlayer ()

@property (strong, nonatomic) FCRequest *startRequest;

@end


@implementation CheckAudioFilePlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

- (void)start
{
    [self.startRequest cancel];
    
    CheckAudioFilePlayerStartRequest *request = [[CheckAudioFilePlayerStartRequest alloc] init];
    request.player = self;
    
    self.startRequest = request;
    
    [request send:^{
        
    }];
}

- (void)stop
{
    //如果启动操作还在进行，则取消
    [self.startRequest cancel];
    
    CheckAudioFilePlayerStopRequest *request = [[CheckAudioFilePlayerStopRequest alloc] init];
    request.player = self;
    
    [request send:^{
        
    }];
}

@end
