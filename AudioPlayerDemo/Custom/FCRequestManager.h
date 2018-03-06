//
//  FCRequestManager.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCRequest.h"


//立即执行的请求管理器
@interface FCRequestManager : NSObject <FCRequestDelegate>

- (void)cancelAll;

@end


//请求并发数管理器，而且支持请求优先发送
@interface FCConcurrencyRequestManager : NSObject <FCRequestDelegate>
{
    
}

//最大并发数，默认5
@property (assign, nonatomic) NSInteger maxCount;

- (void)cancelAll;

@end
