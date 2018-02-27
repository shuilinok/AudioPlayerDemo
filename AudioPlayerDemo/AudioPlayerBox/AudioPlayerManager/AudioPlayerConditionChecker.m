//
//  AudioPlayerConditionChecker.m
//  AudioPlayerDemo
//
//  Created by shuilin on 27/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayerConditionChecker.h"

@interface AudioPlayerConditionChecker ()

//是否打断中
@property (assign, nonatomic) BOOL interrupting;

//当前网络类型
@property (assign, nonatomic) NSInteger netType;

//网络设置
@property (assign, nonatomic) BOOL switchON;

@end


@implementation AudioPlayerConditionChecker

//返回错误码为0表示可以播放，否则不能
- (void)checkStart:(AudioPlayer *)player callback:(FCResultCallback)callback
{
    //检查网络播放设置和当前网络环境
    //...
    
    NSError *error = [NSError errorWithCode:0 xtmsg:@"Check OK"];
    
    callback(error);
}


//监听到打断
- (void)onInterrupt
{
    //恢复打断
    if(!self.interrupting)
    {
        [self.delegate shouldStart];
        
    }
    else
    {
        [self.delegate shouldStop];
    }
}

//监听到设置网络环境等改变
- (void)onChangeCondition
{
    BOOL canPlay = NO;
    
    if(!canPlay)
    {
        [self.delegate shouldStop];
    }
}

@end
