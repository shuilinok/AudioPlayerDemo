//
//  AudioPlayerRequest.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioPlayer;

//核心播放业务请求
@interface AudioPlayerStartRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end


//状态检查请求
@interface AudioPlayerStartCheckStateRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end


//环境设置检查请求
@interface AudioPlayerStartCheckConditionRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end


//包含检查状态和环境条件的启动请求
@interface AudioPlayerCheckStateCondtionStartRequest : FCRequest

@property (strong, nonatomic) AudioPlayerStartRequest *startRequest;

@property (strong, nonatomic) AudioPlayerStartCheckStateRequest *checkStateRequest;

@property (strong, nonatomic) AudioPlayerStartCheckConditionRequest *checkConditionRequest;

@end


//核心播放业务请求
@interface AudioPlayerStopRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end

//状态检查请求
@interface AudioPlayerStopCheckStateRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end


//包含检查状态的停止请求
@interface AudioPlayerCheckStateStopRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@property (strong, nonatomic) AudioPlayerStopRequest *stopRequest;

@property (strong, nonatomic) AudioPlayerStopCheckStateRequest *checkStateRequest;

@end
