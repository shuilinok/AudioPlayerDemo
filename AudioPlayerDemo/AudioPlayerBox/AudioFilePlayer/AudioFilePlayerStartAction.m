//
//  AudioFilePlayerStartAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 01/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "AudioFilePlayerStartAction.h"
#import "AudioFilePlayer.h"
#import "AudioPlayerCheckStartAction.h"
#import "AudioPlayerCheckConditionAction.h"

@implementation AudioFilePlayerStartAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    AudioFilePlayer *player = context;
    
    player.state = AudioPlayer_State_Starting;
    
    //启动播放操作
    //...
    NSLog(@"starting");
    
    player.state = AudioPlayer_State_Started;
    
    [self callbackError:nil];
}

@end


@interface AudioFilePlayerFullStartAction ()

@property (strong, nonatomic) AudioPlayerCheckStartAction *checkStartAction;
@property (strong, nonatomic) AudioPlayerCheckConditionAction *checkConditionAction;
@property (strong, nonatomic) AudioFilePlayerStartAction *startAction;

@end

@implementation AudioFilePlayerFullStartAction

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    AudioFilePlayer *player = context;
    
    AudioPlayerCheckStartAction *checkAction = [[AudioPlayerCheckStartAction alloc] init];
    self.checkStartAction = checkAction;
    [checkAction run:context callback:^(NSError *error) {
       
        if(self.bCancel)
        {
            return;
        }
        
        if(error.code == noErr)
        {
            AudioPlayerCheckConditionAction *checkAction = [[AudioPlayerCheckConditionAction alloc] init];
            self.checkConditionAction = checkAction;
            [checkAction run:context callback:^(NSError *error) {
                
                if(self.bCancel)
                {
                    return;
                }
                
                if(error.code == noErr)
                {
                    AudioFilePlayerStartAction *startAction = [[AudioFilePlayerStartAction alloc] init];
                    self.startAction = startAction;
                    [startAction run:context callback:^(NSError *error) {
                       
                        [self callbackError:error];
                    }];
                }
                else
                {
                    [self callbackError:error];
                }
            }];
        }
        else
        {
            [self callbackError:error];
        }
    }];
    
}

- (void)cancel:(NSUInteger)code
{
    [super cancel:code];
    
    [self.checkStartAction cancel:code];
    [self.checkConditionAction cancel:code];
    [self.startAction cancel:code];
}
@end
