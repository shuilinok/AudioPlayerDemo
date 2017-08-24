//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"
#import "AudioPlayer_Private.h"
#import "AudioFilePlayer_Private.h"
#import "AudioFilePlayerStartAction.h"
#import "AudioFilePlayerStopAction.h"

@implementation AudioFilePlayerParamContext

@end


@implementation AudioFilePlayer

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.afpParamContext = [[AudioFilePlayerParamContext alloc] init];
    }
    
    return self;
}

- (void)start
{
    MCAction *startAction = nil;
    
    if(self.paramContext.startMode == 0)
    {
        AudioFilePlayerStartAction *action = [[AudioFilePlayerStartAction alloc] init];
        startAction = action;
    }
    else if(self.paramContext.startMode == 1)
    {
        
    }
    else if(self.paramContext.startMode == 2)
    {
        AudioFilePlayerFullStartAction *action = [[AudioFilePlayerFullStartAction alloc] init];
        startAction = action;
    }
    
    if(startAction == nil)
    {
        abort();
    }
    
    self.startAction = startAction;
    
    [self.startAction run:self callback:^(NSError *error) {
        
    }];
}

- (void)stop
{
    MCAction *stopAction = nil;
    
    if(self.paramContext.stopMode == 0)
    {
        AudioFilePlayerStopAction *action = [[AudioFilePlayerStopAction alloc] init];
        stopAction = action;
    }
    else if(self.paramContext.stopMode == 1)
    {
        
    }
    else if(self.paramContext.stopMode == 2)
    {
        AudioFilePlayerFullStopAction *action = [[AudioFilePlayerFullStopAction alloc] init];
        stopAction = action;
    }
    
    if(stopAction == nil)
    {
        abort();
    }
    
    self.stopAction = stopAction;
    
    [self.stopAction run:self callback:^(NSError *error) {
        
    }];
}
@end



