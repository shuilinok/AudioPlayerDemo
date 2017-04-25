//
//  NormalAudioFilePlayer.m
//  Created by 税 on 4/21/17.

#import "NormalAudioFilePlayer.h"
#import "NormalAudioPlayer.h"
#import "ConditionAudioPlayer.h"

@interface NormalAudioFilePlayer ()

@property (strong, nonatomic) id<AudioPlayer> normalPlayer;
@end


@implementation NormalAudioFilePlayer

+ (instancetype)createWithUrl:(NSString *)url
{
    AudioFilePlayer *player = [[AudioFilePlayer alloc] initWithUrl:url];
    ConditionAudioPlayer *conditionPlayer = [ConditionAudioPlayer createWithPlayer:player];
    NormalAudioPlayer *normalPlayer = [NormalAudioPlayer createWithPlayer:conditionPlayer];
    
    NormalAudioFilePlayer *object = [NormalAudioFilePlayer alloc];
    object.normalPlayer = normalPlayer;
    
    return object;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSObject *object = self.normalPlayer;
    
    NSMethodSignature *sig;
    sig = [object methodSignatureForSelector:aSelector];
    
    return sig;
}

// Invoke the invocation on whichever real object had a signature for it.
- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSObject *object = self.normalPlayer;
    
    [invocation invokeWithTarget:object];
}

- (BOOL)isEqual:(id)object
{
    return [self.normalPlayer isEqual:object];
}

@end
