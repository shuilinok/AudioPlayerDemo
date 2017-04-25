//
//  ConditionAudioPlayer.m
//  Created by 税 on 4/21/17.


#import "ConditionAudioPlayer.h"

@interface ConditionAudioPlayer ()

@property (strong, nonatomic) id<AudioPlayer> player;
@end

@implementation ConditionAudioPlayer

+ (instancetype)createWithPlayer:(id<AudioPlayer>)player
{
    ConditionAudioPlayer *object = [ConditionAudioPlayer alloc];
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
    //检查设置
    //...
    
    //满足条件就启动
    [self.player start];
}

@end
