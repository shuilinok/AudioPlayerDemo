//
//  FCRequestManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCRequest.h"

//请求并发数管理器，而且支持请求优先发送
@interface FCRequestManager : NSObject
{
    dispatch_queue_t queue;
}

+ (instancetype)sharedInstance;

//最大并发数，默认5
@property (assign, nonatomic) NSInteger maxCount;

//重写
- (void)addRequest:(FCRequest *)request;

- (void)finishRequest:(FCRequest *)request;

@end
