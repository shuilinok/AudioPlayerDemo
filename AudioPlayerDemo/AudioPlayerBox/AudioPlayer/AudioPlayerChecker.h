//
//  AudioPlayerChecker.h
//  AudioPlayerDemo
//
//  Created by shuilin on 08/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AudioPlayer;

//播放检查器
@interface AudioPlayerChecker : NSObject

//返回错误码为0表示可以播放，否则不能
- (void)checkStart:(AudioPlayer *)player callback:(FCResultCallback)callback;

- (void)checkStop:(AudioPlayer *)player callback:(FCResultCallback)callback;

@end



@interface AudioPlayerStateChecker : AudioPlayerChecker


@end


@interface AudioPlayerStateConditionChecker : AudioPlayerChecker


@end
