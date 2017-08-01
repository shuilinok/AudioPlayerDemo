//
//  AudioPlayerCheckStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerCheckStartAction.h"

@implementation AudioPlayerCheckStartAction

- (void)startRun
{
    //检查网络播放设置和当前网络环境
    [self check:^(NSError *error) {
        
        if(error.code == noErr)
        {
            if(!self.isCancel)
            {
                [self checkStartRun];
            }
            else
            {
                NSError *error = [NSError errorWithCode:100 xtmsg:@"启动操作被取消"];
                self.player.error = error;
            }
        }
        else
        {
            self.player.error = error;
        }
    
    }];
}

- (void)check:(ResultCallback)callback
{
    callback(nil);
}

- (void)checkStartRun
{
    
}

@end
