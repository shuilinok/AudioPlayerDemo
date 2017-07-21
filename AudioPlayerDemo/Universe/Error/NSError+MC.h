//
//  NSError+MC.h
//  xuetangX-iPhone
//
//  Created by shuilin on 11/12/15.
//  Copyright © 2015 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (MC)

+ (NSError *)errorWithCode:(NSUInteger)code xtmsg:(NSString *)message;

/* 错误信息 */
- (NSString *)xtmsg;

@end
