//
//  FCRequestManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCRequest.h"

@protocol FCRequestManager <NSObject>

//子类重写
- (void)addRequest:(FCRequest *)request;

- (void)finishRequest:(FCRequest *)request;

@end


//立即执行的请求管理器
@interface FCRequestManager : NSObject <FCRequestManager>


+ (instancetype)sharedInstance;


@end


//异步请求管理器
@interface FCQueueRequestManager : NSObject <FCRequestManager>
{
    dispatch_queue_t queue;
}

+ (instancetype)sharedInstance;

@end


//请求并发数管理器，而且支持请求优先发送
@interface FCConcurrencyRequestManager : NSObject <FCRequestManager>
{
    dispatch_queue_t queue;
}

+ (instancetype)sharedInstance;

//最大并发数，默认5
@property (assign, nonatomic) NSInteger maxCount;

@end
