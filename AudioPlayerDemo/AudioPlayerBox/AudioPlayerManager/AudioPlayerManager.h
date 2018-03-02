//
//  AudioPlayerManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@protocol AudioPlayerManager <NSObject>

- (void)start:(AudioPlayer *)player;

- (void)stop:(AudioPlayer *)player;

@end


@interface AudioPlayerManager : NSObject <AudioPlayerManager>


@end
