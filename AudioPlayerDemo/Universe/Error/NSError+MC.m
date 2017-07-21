//
//  NSError+MC.m
//  xuetangX-iPhone
//
//  Created by shuilin on 11/12/15.
//  Copyright © 2015 xuetang. All rights reserved.
//

#import "NSError+MC.h"

#define kErrorMessage     @"ErrorMessage"

@implementation NSError (MC)

+ (NSError *)errorWithCode:(NSUInteger)code xtmsg:(NSString *)message
{
    NSDictionary *userInfo = @{
                               kErrorMessage:message ? : @""
                               };
    
    NSError *error = [NSError errorWithDomain:@"com.enjoyloop.iOS" code:code userInfo:userInfo];
    
    return error;
}

/* 错误信息 */
- (NSString *)xtmsg
{
    return [self.userInfo objectForKey:kErrorMessage];
}
@end
