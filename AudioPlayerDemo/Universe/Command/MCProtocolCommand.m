//
//  MCProtocolCommand.m
//  xuetangX-iPhone
//
//  Created by shuilin on 12/16/15.
//  Copyright © 2015 xuetang. All rights reserved.
//

#import "MCProtocolCommand.h"

@interface MCProtocolCommand ()
@property (strong, nonatomic) NSInvocation *invocation;
@end

@implementation MCProtocolCommand

+ (MCProtocolCommand *)command:(id)target selector:(SEL)selector
{
    NSMethodSignature * sig  = [[target class] instanceMethodSignatureForSelector:selector];
    NSInvocation * invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:target];
    [invocation setSelector:selector];
    
    //构建命令
    MCProtocolCommand *command = [[MCProtocolCommand alloc] init];
    command.invocation = invocation;
    
    return command;
}

- (id)execute:(NSUInteger)num,...
{
    NSInvocation * invocation = self.invocation;
    
    NSUInteger index = 2;
    
    /* 可变参数 */
    va_list args;
    
    va_start(args,num);
    
    while (num > index - 2)
    {
        id param = va_arg(args, id);//下一个参数;
        
        [invocation setArgument:&param atIndex:index++];
    }
    
    //[invocation retainArguments];不要持有
    
    va_end(args);
    
    [invocation invoke];

    //返回值
    __unsafe_unretained id value;
    
    [invocation getReturnValue:&value];
    
    return value;
}
@end
