//
//  AudioPlayerStoppedRequest.h
//  AudioPlayerDemo
//
//  Created by shuilin on 24/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "FCRequest.h"


@class AudioPlayer;

//等待停止请求
@interface AudioPlayerStoppedRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

@end
