//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@interface AudioFilePlayer ()

@property (strong, nonatomic) NSString *url;

@end


@implementation AudioFilePlayer

+ (instancetype)createWithUrl:(NSString *)url
{
    AudioFilePlayer *player = [[AudioFilePlayer alloc] initWithUrl:url];
    player.startAction = [[AudioFilePlayerCheckStartAction alloc] initWithPlayer:player];
    player.stopAction = [[AudioFilePlayerStopAction alloc] initWithPlayer:player];
    
    return player;
}

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if(self)
    {
        self.url = url;
    }
    
    return self;
}

@end



