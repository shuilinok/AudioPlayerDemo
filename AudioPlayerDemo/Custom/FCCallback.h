//
//  FCCallback.h
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^FCCallback) (void);

typedef void (^FCDataCallback) (id data);

typedef void (^FCResultCallback) (NSError *error);

void mainFCCallback(FCCallback callback);

void mainFCDataCallback(FCDataCallback callback, id data);

