//
//  FCRequest.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCCallback.h"

@class FCRequestManager;

@interface FCRequest : NSObject

@property (assign, nonatomic) NSInteger code;

@property (strong, nonatomic) NSString *msg;

@property (weak, nonatomic) FCRequestManager *manager;

@property (assign, nonatomic) NSUInteger level;//优先级，默认0，值越大越优先

@property (readonly, assign, nonatomic) BOOL bCancel;

+ (id)normalRequest;

- (void)send:(FCCallback)callback;

- (void)cancel;

- (void)execute;//实现

- (void)finish;

@end







