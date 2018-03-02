//
//  SumAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "SumAudioPlayerManager.h"


@interface SumAudioPlayerManager () <AudioPlayerConditionCheckerDelegate>

@property (strong, nonatomic) AudioPlayerStateChecker *stateChecker;

@property (strong, nonatomic) AudioPlayerConditionChecker *conditionChecker;

@property (strong, nonatomic) AudioPlayer *player;

@property (strong, nonatomic) FCConcurrencyRequestManager *requestManager;

@end


@implementation SumAudioPlayerManager

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        AudioPlayerConditionChecker *conditionChecker = [[AudioPlayerConditionChecker alloc] init];
        conditionChecker.delegate = self;
        
        AudioPlayerStateChecker *stateChecker = [[AudioPlayerStateChecker alloc] init];
        
        self.conditionChecker = conditionChecker;
        self.stateChecker = stateChecker;
        
        FCConcurrencyRequestManager *requestManager = [[FCConcurrencyRequestManager alloc] init];
        requestManager.maxCount = 1;
        
        self.requestManager = requestManager;
    }
    return self;
}

- (void)start:(AudioPlayer *)player
{
    //串行
    FCRequest *request = [[FCRequest alloc] init];
    request.manager = self.requestManager;
    
    [request send:^{
        
        if(self.player)
        {
            //先停止以前的
            NSError *error = [self.stateChecker checkStop:self.player];
            if(error.code == noErr)
            {
                [self.player stop];
            }
            
            //等待完全停止
            [self.player waitStopped:^{
                
                self.player = player;
                
                [self checkStart:request];
            }];
        }
        else
        {
            self.player = player;
            
            [self checkStart:request];
        }
        
    } callback:^{
        
    }];
    
}

- (void)checkStart:(FCRequest *)request
{
    AudioPlayer *player = self.player;
    
    //检查状态
    NSError *error = [self.stateChecker checkStart:player];
    
    if(error.code == noErr)
    {
        //检查环境
        player.state = AudioPlayer_State_Starting;
        
        [self.conditionChecker checkStart:player callback:^(NSError *error) {
            
            if(request.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                //开始新的播放
                [player start];
                [request finish];
            }
            else
            {
                request.code = error.code;
                [request finish];
            }
        }];
    }
    else
    {
        request.code = error.code;
        [request finish];
    }
}

- (void)stop:(AudioPlayer *)player
{
    [self.requestManager cancelAll];
    
    //串行
    FCRequest *request = [[FCRequest alloc] init];
    request.manager = self.requestManager;
    
    [request send:^{
        
        if(player == self.player)
        {
            NSError *error = [self.stateChecker checkStop:player];
            
            if(error.code == noErr)
            {
                player.state = AudioPlayer_State_Stopping;
                
                //可以检查
                //...
                
                [player stop];
            }
        }
        
        [request finish];
        
    } callback:^{
        
    }];
    
}

- (void)shouldStart
{
    [self.player checkStart];
}

- (void)shouldStop
{
    [self.player checkStop];
}

@end
