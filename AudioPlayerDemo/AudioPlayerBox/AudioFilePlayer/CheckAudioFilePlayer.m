//
//  CheckAudioFilePlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 09/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "CheckAudioFilePlayer.h"
#import "AudioPlayerChecker.h"


@interface CheckAudioFilePlayer ()

@property (strong, nonatomic) AudioPlayerCancelContext *startContext;

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
    self.startContext.bCancel = YES;
    
    AudioPlayerCancelContext *context = [[AudioPlayerCancelContext alloc] init];
    self.startContext = context;
    
    AudioPlayerChecker *checker = [[AudioPlayerChecker alloc] init];
    
    if(self.startMode == 0)
    {
        [super start:context];
    }
    else if(self.startMode == 1)
    {
        [checker checkStartState:self callback:^(NSError *error) {
          
            if(context.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                [super start:context];
            }
        }];
    }
    else if(self.startMode == 2)
    {
        [checker checkStartStateCondition:self callback:^(NSError *error) {
            
            if(context.bCancel)
            {
                return;
            }
            
            if(error.code == noErr)
            {
                [super start:context];
            }
        }];
    }
    else
    {
        NSLog(@"不支持的启动模式:%ld",self.startMode);
    }
}

- (void)stop
{
    //如果启动操作还在进行，则取消
    self.startContext.bCancel = YES;
    
    AudioPlayerChecker *checker = [[AudioPlayerChecker alloc] init];
    
    [checker checkStopState:self callback:^(NSError *error) {
        
        if(error.code == noErr)
        {
            [super stop];
        }
    }];
}

@end
