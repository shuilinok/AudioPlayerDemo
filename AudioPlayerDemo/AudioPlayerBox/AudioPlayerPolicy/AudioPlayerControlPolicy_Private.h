//
//  AudioPlayerControlPolicy_Private.h
//  AudioPlayerDemo
//
//  Created by shuilin on 21/07/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayerControlPolicy.h"
#import "AudioPlayer.h"

@interface AudioPlayerControlPolicy ()

//观察播放器
@property (weak, nonatomic) AudioPlayer *player;

@end



@interface AudioPlayerControlPolicy (TemplateMethod)

- (void)handleChangedState:(AudioPlayer_State)state;

@end
