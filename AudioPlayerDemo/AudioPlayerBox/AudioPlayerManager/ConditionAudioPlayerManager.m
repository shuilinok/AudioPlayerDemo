//
//  ConditionAudioPlayerManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "ConditionAudioPlayerManager.h"
#import "AudioPlayerStoppedRequest.h"

@interface ConditionAudioPlayerManager ()

@property (strong, nonatomic) AudioPlayer *player;

//是否打断中
@property (assign, nonatomic) BOOL interrupting;

//当前网络类型
@property (assign, nonatomic) NSInteger netType;

//网络设置
@property (assign, nonatomic) BOOL switchON;

@end


@implementation ConditionAudioPlayerManager


- (void)startPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    if(self.player)
    {
        //把原来的停止
        [self stopPlayer:self.player callback:^{
            
            //再起来
            [self checkStartPlayer:player callback:^{
                
                callback();
            }];
        }];
    }
    else
    {
        [self checkStartPlayer:player callback:^{
            
            callback();
        }];
    }
}

- (void)stopPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    [self.delegate stopPlayer:player callback:^{
        
    }];
    
    //等待停止
    AudioPlayerStoppedRequest *request = [[AudioPlayerStoppedRequest alloc] init];
    request.player = player;
    
    [request send:^{
        
        callback();
    }];
}


- (void)checkStartPlayer:(AudioPlayer *)player callback:(FCCallback)callback
{
    self.player = player;
    
    //检查网络播放设置和当前网络环境
    NSError *error = [NSError errorWithCode:0 xtmsg:@"Check OK"];
    
    if(error.code == noErr)
    {
        [self.delegate startPlayer:player callback:^{
           
            callback();
        }];
    }
    else
    {
        callback();
    }
}

//监听到打断
- (void)onInterrupt
{
    //恢复打断
    if(!self.interrupting)
    {
        [self startPlayer:self.player callback:^{
            
        }];
    }
    else
    {
        [self stopPlayer:self.player callback:^{
            
        }];
    }
}

//监听到设置网络环境等改变
- (void)onChangeCondition
{
    BOOL canPlay = NO;
    
    if(!canPlay)
    {
        [self stopPlayer:self.player callback:^{
            
        }];
    }
}

@end
