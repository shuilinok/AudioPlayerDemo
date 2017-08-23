//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"
#import "AudioFilePlayerStartAction.h"
#import "AudioFilePlayerStopAction.h"

@implementation AudioFilePlayerParamContext

- (MCAction *)createStartAction
{
    MCAction *startAction = nil;
    
    if(self.startMode == 0)
    {
        AudioFilePlayerStartAction *action = [[AudioFilePlayerStartAction alloc] init];
        startAction = action;
    }
    else if(self.startMode == 1)
    {
        
    }
    else if(self.startMode == 2)
    {
        AudioFilePlayerFullStartAction *action = [[AudioFilePlayerFullStartAction alloc] init];
        startAction = action;
    }
    
    if(startAction == nil)
    {
        abort();
    }
    
    return startAction;
}

- (MCAction *)createStopAction
{
    MCAction *stopAction = nil;
    
    if(self.stopMode == 0)
    {
        AudioFilePlayerStopAction *action = [[AudioFilePlayerStopAction alloc] init];
        stopAction = action;
    }
    else if(self.stopMode == 1)
    {
        
    }
    else if(self.stopMode == 2)
    {
        AudioFilePlayerFullStopAction *action = [[AudioFilePlayerFullStopAction alloc] init];
        stopAction = action;
    }
    
    if(stopAction == nil)
    {
        abort();
    }
    
    return stopAction;
}

@end


@interface AudioFilePlayer ()

@property (strong, nonatomic) AudioFilePlayerParamContext *paramContext;

@end


@implementation AudioFilePlayer

@dynamic paramContext;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        self.paramContext = [[AudioFilePlayerParamContext alloc] init];
    }
    
    return self;
}


@end



