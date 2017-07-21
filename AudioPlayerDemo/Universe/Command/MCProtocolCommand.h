//
//  MCProtocolCommand.h
//  xuetangX-iPhone
//
//  Created by shuilin on 12/16/15.
//  Copyright © 2015 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MCProtocolCommand : NSObject

+ (MCProtocolCommand *)command:(id)target selector:(SEL)selector;

- (id)execute:(NSUInteger)num,...;//num设置为后面的可变参数的个数

@end
