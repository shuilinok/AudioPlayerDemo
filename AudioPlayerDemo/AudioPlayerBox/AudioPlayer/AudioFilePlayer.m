//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"


@interface AudioFilePlayer ()
{
    dispatch_queue_t queue;
}
@property (strong, nonatomic) FCRequest *playRequest;

@end

@implementation AudioFilePlayer

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

//子类实现
- (void)start
{
    FCRequest *request = [[FCRequest alloc] init];
    self.playRequest = request;
    
    [request send:^{
        
        self.state = AudioPlayer_State_Starting;
        
        dispatch_async(queue, ^{
            
            //启动播放操作
            //...
            
            [NSThread sleepForTimeInterval:1];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if(request.bCancel)
                {
                    return;
                }
                
                self.state = AudioPlayer_State_Started;
                
                [request finish];
            });
            
            
        });
        
    } callback:^{
        
    }];
 
}

- (void)stop
{
    [self.playRequest cancel];
    
    self.state = AudioPlayer_State_Stopping;
    
    dispatch_async(queue, ^{
        
        //停止播放操作
        //...
        
        [NSThread sleepForTimeInterval:0.6];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.state = AudioPlayer_State_Stopped;
            
        });
        
        
    });
}

@end



