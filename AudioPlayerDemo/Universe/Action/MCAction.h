//
//  MCAction.h
//  AudioPlayerDemo
//
//  Created by shuilin on 02/08/2017.
//  Copyright © 2017 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

//行为抽象，包含：运行，回调，取消
@interface MCAction : NSObject

//是否取消运行
@property (readonly, assign, nonatomic) BOOL bCancel;

//运行完后回调函数，外部不要设置，由子类设置
@property (copy, nonatomic) ResultCallback callback;

//运行，子类重写
- (void)run:(id)context callback:(ResultCallback)callback;

//取消运行，子类可重写
- (void)cancel:(NSUInteger)code;

//运行完后返回，外部不要调用，子类也不要重写
- (void)callbackError:(NSError *)error;

@end


@interface MCActionCreator : NSObject

+ (MCAction *)createAction:(NSString *)actionName;

@end
