//
//  AudioPlayer_Private.h
//  AudioPlayerDemo
//
//  Created by shuilin on 24/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioPlayer.h"

@interface AudioPlayer ()

@property (strong, nonatomic) MCAction *startAction;

@property (strong, nonatomic) MCAction *stopAction;

@property (strong, nonatomic) AudioPlayerParamContext *paramContext;

@end
