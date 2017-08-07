//
//  AudioFilePlayerStopAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStopAction.h"
#import "AudioFilePlayer.h"
#import "AudioPlayerCheckStopAction.h"

@implementation AudioFilePlayerStopAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    AudioFilePlayer *player = context;
    
    player.state = AudioPlayer_State_Stopping;
    
    //停止播放操作
    //...
    NSLog(@"stopping");
    
    player.state = AudioPlayer_State_Stopped;
    
    [self callbackError:nil];
}

@end

@interface AudioFilePlayerFullStopAction ()
@property (strong, nonatomic) AudioPlayerCheckStopAction *checkAction;
@property (strong, nonatomic) AudioFilePlayerStopAction *stopAction;
@end

@implementation AudioFilePlayerFullStopAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    AudioFilePlayer *player = context;
    
    //如果启动操作还在进行，则取消
    [player.startAction cancel:0];
    
    AudioPlayerCheckStopAction *checkAction = [[AudioPlayerCheckStopAction alloc] init];
    self.checkAction = checkAction;
    [checkAction run:context callback:^(NSError *error) {
        
        if(self.bCancel)
        {
            return;
        }
        
        if(error.code == noErr)
        {
            AudioFilePlayerStopAction *stopAction = [[AudioFilePlayerStopAction alloc] init];
            self.stopAction = stopAction;
            [stopAction run:context callback:^(NSError *error) {
                
                [self callbackError:error];
            }];
            
        }
        else
        {
            [self callbackError:error];
        }
    }];
}

- (void)cancel:(NSUInteger)code
{
    [super cancel:code];
    
    [self.checkAction cancel:code];
    [self.stopAction cancel:code];
}

@end
