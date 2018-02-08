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

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        self.requests = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addRequest:(FCRequest *)request
{
    [self.requests addObject:request];
    
    [request execute];
}

- (void)finishRequest:(FCRequest *)request
{
    [self.requests removeObject:request];
}

@end


@interface FCQueueRequestManager ()

@property (strong, nonatomic) NSMutableArray *requests;

@end

@implementation FCQueueRequestManager

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        NSString *className = NSStringFromClass([self class]);
        NSString *name = [NSString stringWithFormat:@"com.yourdomain.%@",className];
        
        queue = dispatch_queue_create(name.UTF8String, NULL);
        
        self.requests = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addRequest:(FCRequest *)request
{
    dispatch_async(queue, ^{
        
        [self.requests addObject:request];
        
        [request execute];
        
    });
}

- (void)finishRequest:(FCRequest *)request
{
    dispatch_async(queue, ^{
        
        [self.requests removeObject:request];
        
    });
}

@end


@interface FCConcurrencyRequestManager ()

@property (strong, nonatomic) NSMutableArray *requests;

@property (strong, nonatomic) NSMutableArray *waitingRequests;

@end


@implementation FCConcurrencyRequestManager

+ (instancetype)sharedInstance
{
    static id object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[[self class] alloc] init];
    });
    
    return object;
}

- (id)init
{
    self = [super init];
    if(self)
    {
        NSString *className = NSStringFromClass([self class]);
        NSString *name = [NSString stringWithFormat:@"com.yourdomain.%@",className];
        
        queue = dispatch_queue_create(name.UTF8String, NULL);
        
        self.requests = [[NSMutableArray alloc] init];
        self.waitingRequests = [[NSMutableArray alloc] init];
        
        self.maxCount = 5;
    }
    return self;
}

- (void)addRequest:(FCRequest *)request
{
    dispatch_async(queue, ^{
        
        if(self.requests.count < self.maxCount)//直接执行
        {
            [self.requests addObject:request];
            
            [request execute];
        }
        else    //放入等待
        {
            [self.waitingRequests addObject:request];
        }
    });
    
}

- (void)finishRequest:(FCRequest *)request
{
    dispatch_async(queue, ^{
        
        if(request && [self.requests containsObject:request])
        {
            [self.requests removeObject:request];
            [self handleNextRequest];//取出等待中的执行
        }
        else if(request && [self.waitingRequests containsObject:request])
        {
            [self.waitingRequests removeObject:request];
        }
    });
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
        
        [request execute];
    }
}

@end
