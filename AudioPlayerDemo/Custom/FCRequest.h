//
//  FCRequest.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCCallback.h"

@protocol FCRequestManager;

@interface FCRequest : NSObject

@property (assign, nonatomic) NSInteger code;

@property (strong, nonatomic) NSString *msg;

@property (weak, nonatomic) id<FCRequestManager> manager;//默认FCRequestManager单例

@property (assign, nonatomic) NSUInteger level;//优先级，默认0，值越大越优先

@property (readonly, assign, nonatomic) BOOL bCancel;

- (void)send:(FCCallback)callback;//外部调用

- (void)cancel;//外部调用，子类重写

- (void)execute;//子类实现

- (void)finish;//子类调用

@end




