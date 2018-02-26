//
//  AudioPlayerStartedRequest.h
//  AudioPlayerDemo
//
//  Created by shuilin on 26/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "FCRequest.h"


@class AudioPlayer;

//等待开始请求
@interface AudioPlayerStartedRequest : FCRequest

@property (weak, nonatomic) AudioPlayer *player;

- (void)send:(FCCallback)callback;

@end
