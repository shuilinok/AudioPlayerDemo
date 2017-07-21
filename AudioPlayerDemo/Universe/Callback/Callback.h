//
//  Callback.h
//  Producer
//
//  Created by shuilin on 8/18/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResultCallback) (NSError* error);

typedef void (^DataResultCallback) (id data,NSError* error);

void mainResultCallback(ResultCallback callback, NSError *error);

void mainDataResultCallback(DataResultCallback callback, id data, NSError *error);
