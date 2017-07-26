//
//  AudioPlayerDefine.h
//  AudioPlayerDemo
//
//  Created by shuilin on 25/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#ifndef AudioPlayerDefine_h
#define AudioPlayerDefine_h

//播放器状态
typedef NS_ENUM(NSUInteger, AudioPlayer_State) {
    AudioPlayer_State_None = 0,        //初始状态
    AudioPlayer_State_Starting,        //启动中
    AudioPlayer_State_Started,         //已启动
    AudioPlayer_State_Stopping,        //停止中
    AudioPlayer_State_Stopped,         //已停止
};

#endif /* AudioPlayerDefine_h */
