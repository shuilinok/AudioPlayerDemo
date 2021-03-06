//
//  FCRequest.m
//  RequestTest
//
//  Created by shuilin on 26/02/2018.
//  Copyright © 2018 xuetangX. All rights reserved.
//

#import "FCRequest.h"
#import "FCRequestManager.h"

@interface FCRequest ()

@property (copy, nonatomic) FCCallback callback;

@property (assign, nonatomic) BOOL bCancel;

//要执行的代码块
@property (copy, nonatomic) dispatch_block_t block;

@end


@implementation FCRequest

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

- (void)send:(dispatch_block_t)block callback:(FCCallback)callback
{
    self.callback = callback;
    self.block = block;
    
    if(self.bCancel)
    {
        self.code = 73;
        
        self.msg = @"请求已被取消";
        
        [self finish];
        
        return;
    }
    
    if(self.delegate == nil)
    {
        [self execute];
    }
    else
    {
        [self.delegate sendRequest:self];
    }
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
    if(self.block)
    {
        self.block();
    }
}

- (void)finish
{
    if (self.callback)
    {
        self.callback();
        self.callback = nil;
    }
    
    self.block = nil;
    
    [self.delegate finishRequest:self];
}

@end
