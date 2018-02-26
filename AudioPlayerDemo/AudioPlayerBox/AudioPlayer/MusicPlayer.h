//
//  MusicPlayer.h
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioPlayer.h"
#import "AudioFilePlayer.h"

@interface MusicPlayer : AudioPlayer

@property (strong, nonatomic) NSString *musicID;

@property (strong, nonatomic) AudioFilePlayer *filePlayer;

@end

