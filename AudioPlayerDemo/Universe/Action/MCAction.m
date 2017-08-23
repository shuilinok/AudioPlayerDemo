//
//  MCAction.m
//  AudioPlayerDemo
//
//  Created by shuilin on 02/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import "MCAction.h"

@interface MCAction ()

//是否取消运行
@property (assign, nonatomic) BOOL bCancel;

@end

@implementation MCAction

- (void)callbackError:(NSError *)error
{
    if(self.callback)
    {
        self.callback(error);
        self.callback = nil;
    }
}

//取消
- (void)cancel:(NSUInteger)code
{
    self.bCancel = YES;
    
    NSError *error = [NSError errorWithCode:code xtmsg:@"操作被取消"];
    [self callbackError:error];
}

- (void)run:(id)context callback:(ResultCallback)callback
{
    self.callback = callback;
    
    //...
    
    [self callbackError:nil];
}

@end



