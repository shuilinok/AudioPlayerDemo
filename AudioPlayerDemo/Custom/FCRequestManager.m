//
//  FCRequestManager.m
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "FCRequestManager.h"

@interface FCRequestManager ()

@property (strong, nonatomic) NSMutableArray *requests;

@end


@implementation FCRequestManager

- (id)init
{
    self = [super init];
    if(self)
    {
        self.requests = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)sendRequest:(FCRequest *)request
{
    [self.requests addObject:request];
    
    [request execute];
}

- (void)finishRequest:(FCRequest *)request
{
    [self.requests removeObject:request];
}

- (void)cancelAll
{
    NSMutableArray *requests = [[NSMutableArray alloc] init];
    for(FCRequest *request in self.requests)
    {
        [requests addObject:request];
    }
    
    for(FCRequest *request in requests)
    {
        [request cancel];
    }
}

@end



@interface FCConcurrencyRequestManager ()

@property (strong, nonatomic) NSMutableArray *requests;

@property (strong, nonatomic) NSMutableArray *waitingRequests;

@end


@implementation FCConcurrencyRequestManager

- (id)init
{
    self = [super init];
    if(self)
    {
        self.requests = [[NSMutableArray alloc] init];
        self.waitingRequests = [[NSMutableArray alloc] init];
        
        self.maxCount = 5;
    }
    return self;
}

- (void)sendRequest:(FCRequest *)request
{
    if(self.requests.count < self.maxCount)//直接执行
    {
        [self.requests addObject:request];
        
        //NSLog(@"开始执行 %@",NSStringFromClass([request class]));
        
        [request execute];
    }
    else    //放入等待
    {
        [self.waitingRequests addObject:request];
    }
    
}

- (void)finishRequest:(FCRequest *)request
{
    if(request && [self.requests containsObject:request])
    {
        [self.requests removeObject:request];
        [self handleNextRequest];//取出等待中的执行
    }
    else if(request && [self.waitingRequests containsObject:request])
    {
        [self.waitingRequests removeObject:request];
    }
}

//从等待队列中获取优先级最高的请求
- (FCRequest *)highestLevelRequest
{
    NSUInteger count = [self.waitingRequests count];
    
    if(count == 0)
    {
        return nil;
    }
    
    FCRequest *request = [self.waitingRequests objectAtIndex:0];
    
    for(FCRequest *temp in self.waitingRequests)
    {
        if(temp.level > request.level)
        {
            request = temp;
        }
    }
    
    return request;
}

- (void)handleNextRequest
{
    FCRequest *request = [self highestLevelRequest];
    if(request)
    {
        [self.requests addObject:request];
        [self.waitingRequests removeObject:request];
        
        //NSLog(@"开始执行 %@",NSStringFromClass([request class]));
        [request execute];
    }
}

- (void)cancelAll
{
    {
        NSMutableArray *requests = [[NSMutableArray alloc] init];
        for(FCRequest *request in self.requests)
        {
            [requests addObject:request];
        }
        
        for(FCRequest *request in requests)
        {
            [request cancel];
        }
    }
    
    {
        NSMutableArray *requests = [[NSMutableArray alloc] init];
        for(FCRequest *request in self.waitingRequests)
        {
            [requests addObject:request];
        }
        
        for(FCRequest *request in requests)
        {
            [request cancel];
        }
    }
}

@end
