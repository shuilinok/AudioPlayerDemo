//
//  MusicPlayer.m
//  AudioPlayerDemo
//
//  Created by shuilin on 23/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "MusicPlayer.h"
#import "AudioFilePlayer.h"

@interface MusicPlayer ()
{
    dispatch_queue_t queue;
}
@property (strong, nonatomic) FCRequest *playRequest;

@property (strong, nonatomic) AudioFilePlayer *filePlayer;

@end


@implementation MusicPlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        NSString *className = NSStringFromClass([self class]);
        NSString *name = [NSString stringWithFormat:@"com.yourdomain.%@",className];
        queue = dispatch_queue_create(name.UTF8String, NULL);
    }
    
    return self;
}

- (void)dealloc
{
    self.filePlayer = nil;
}

- (void)start:(FCRequest *)request
{
    self.state = AudioPlayer_State_Starting;
    
    dispatch_async(queue, ^{
        
        //根据musicID获取url
        //...
        
        [NSThread sleepForTimeInterval:1];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if(request.bCancel)
            {
                return;
            }
            
            NSString *url;
            
            AudioFilePlayer *filePlayer = [[AudioFilePlayer alloc] init];
            filePlayer.url = url;
            self.filePlayer = filePlayer;
            
            [filePlayer checkStart];
            
            [request finish];
        });
    });
}

//子类实现
- (void)start
{
    FCRequest *request = [[FCRequest alloc] init];
    self.playRequest = request;
    
    [request send:^{
        
        [self start:request];
        
    } callback:^{
        
    }];
}

- (void)stop
{
    [self.playRequest cancel];
    
    //这里还可加入异步stopping
    //...
    
    [self.filePlayer checkStop];
}

//开始观察
- (void)beginObserve
{
    id temp = _filePlayer;
    [temp addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
}

//结束观察
- (void)endObserve
{
    id temp = _filePlayer;
    [temp removeObserver:self forKeyPath:@"state" context:NULL];
}

- (void)setFilePlayer:(AudioFilePlayer *)filePlayer
{
    [self endObserve];
    
    _filePlayer = filePlayer;
    
    [self beginObserve];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(self.filePlayer == object)
    {
        if([keyPath isEqualToString:@"state"])
        {
            self.state = self.filePlayer.state;
        }
        else if([keyPath isEqualToString:@"error"])
        {
            self.error = self.filePlayer.error;
        }
    }
}

@end

