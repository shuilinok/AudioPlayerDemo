//
//  AudioPlayerCheckConditionAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerCheckConditionAction.h"
#import "AudioPlayer.h"

@implementation AudioPlayerCheckConditionAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    
    //检查网络播放设置和当前网络环境
    [self check:^(NSError *error) {
        
        [self callbackError:error];
        
    }];
}

- (void)check:(ResultCallback)callback
{
    NSLog(@"checking");
    
    callback(nil);
}

@end
