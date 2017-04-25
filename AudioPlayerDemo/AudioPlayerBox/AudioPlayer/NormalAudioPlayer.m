//
//  NormalAudioPlayer.m
//  Created by 税 on 4/21/17.

#import "NormalAudioPlayer.h"

@interface NormalAudioPlayer ()

@property (strong, nonatomic) id<AudioPlayer> player;
@end

@implementation NormalAudioPlayer

+ (instancetype)createWithPlayer:(id<AudioPlayer>)player
{
    NormalAudioPlayer *object = [NormalAudioPlayer alloc];
    object.player = player;

    return object;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSObject *object = self.player;
    
    NSMethodSignature *sig;
    sig = [object methodSignatureForSelector:aSelector];
    
    return sig;
}

// Invoke the invocation on whichever real object had a signature for it.
- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSObject *object = self.player;
    
    [invocation invokeWithTarget:object];
}

- (BOOL)isEqual:(id)object
{
    return [self.player isEqual:object];
}

/* 开始播放 */
- (void)start
{
    [[self.player state] start:self.player];
}

/* 停止播放 */
- (void)stop
{
    [[self.player state] stop:self.player];
}


@end
