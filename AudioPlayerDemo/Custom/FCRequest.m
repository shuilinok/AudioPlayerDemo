//
//  FCRequest.m
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "FCRequest.h"
#import "FCRequestManager.h"

@interface FCRequest ()

@property (copy, nonatomic) FCCallback callback;

@property (assign, nonatomic) BOOL bCancel;

@end


@implementation FCRequest

+ (id)normalRequest
{
    FCRequest *request = [[[self class] alloc] init];
    
    request.manager = [FCRequestManager sharedInstance];
    
    return request;
}

- (void)send:(FCCallback)callback
{
    self.callback = callback;
    
    if(self.bCancel)
    {
        self.code = 73;
        
        self.msg = @"请求已被取消";
        
        [self finish];
        
        return;
    }
    
    [self.manager addRequest:self];

}

- (void)cancel
{
    if(!self.bCancel)
    {
        self.bCancel = YES;
        
        self.code = 72;
        
        self.msg = @"请求被取消";
        
        [self finish];
    }
}

- (void)execute
{
    abort();
}

- (void)finish
{
    mainFCCallback(self.callback);
    
    self.callback = nil;
    
    [self.manager finishRequest:self];
}

@end


