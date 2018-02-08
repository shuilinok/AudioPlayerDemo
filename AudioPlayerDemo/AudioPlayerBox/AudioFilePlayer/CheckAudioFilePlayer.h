//
//  CheckAudioFilePlayer.h
//  AudioPlayerDemo
//
//  Created by shuilin on 08/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "AudioFilePlayer.h"
#import "AudioPlayerChecker.h"

@interface CheckAudioFilePlayer : AudioFilePlayer

@property (strong, nonatomic) AudioPlayerChecker *checker;

@end
