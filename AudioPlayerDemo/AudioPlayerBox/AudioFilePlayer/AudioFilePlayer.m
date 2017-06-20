//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"

@interface AudioFilePlayer ()

@property (strong, nonatomic) NSString *url;

@end


@implementation AudioFilePlayer

- (instancetype)initWithUrl:(NSString *)url
{
    self = [super init];
    if(self)
    {
        self.url = url;
        self.startPolicy = [[AudioFilePlayerStartPolicy alloc] init];
        self.stopPolicy = [[AudioFilePlayerStopPolicy alloc] init];
    }
    
    return self;
}

@end



@implementation AudioFilePlayerStartPolicy

- (NSError *)check
{
    //检查设置
    //...

    return nil;
}

- (void)start
{
    NSError *error = [self check];
    
    //满足条件就启动
    if(error.code == noErr)
    {
        self.player.state = [[AudioPlayerStartingState alloc] init];
        
        //启动播放操作
        //...
        
        self.player.state = [[AudioPlayerStartedState alloc] init];
    }
    else
    {
        self.player.error = error;
    }
}

@end


@implementation AudioFilePlayerStopPolicy

- (void)stop
{
    self.player.state = [[AudioPlayerStoppingState alloc] init];
    
    //停止播放操作
    //...
    
    self.player.state = [[AudioPlayerStoppedState alloc] init];
}

@end

