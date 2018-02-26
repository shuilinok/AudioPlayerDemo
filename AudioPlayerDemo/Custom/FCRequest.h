//
//  FCRequest.h
//  RequestTest
//
//  Created by shuilin on 26/02/2018.
//  Copyright © 2018 xuetangX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCCallback.h"

@protocol FCRequestManager;

@interface FCRequest : NSObject

@property (assign, nonatomic) NSInteger code;

@property (strong, nonatomic) NSString *msg;

@property (strong, nonatomic) id data;//可以存储执行结果

@property (weak, nonatomic) id<FCRequestManager> manager;//默认nil，直接执行

@property (assign, nonatomic) NSUInteger level;//优先级，默认0，值越大越优先

@property (readonly, assign, nonatomic) BOOL bCancel;

//外部调用
- (void)send:(dispatch_block_t)block callback:(FCCallback)callback;

- (void)cancel;

- (void)finish;

@end


//管理器调用
@interface FCRequest (Manager)

- (void)execute;

@end




