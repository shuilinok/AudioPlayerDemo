//
//  AudioPlayerAction.h
//  AudioPlayerDemo
//
//  Created by shuilin on 28/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudioPlayer.h"

@interface AudioPlayerAction : NSObject

- (instancetype)initWithPlayer:(AudioPlayer *)player;

@property (readonly, weak, nonatomic) AudioPlayer *player;

@property (assign, nonatomic) BOOL isCancel;

- (void)run;

- (void)handleChangedState:(AudioPlayer_State)state;

@end
