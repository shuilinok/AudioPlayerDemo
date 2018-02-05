//
//  FCCallback.m
//  AudioPlayerDemo
//
//  Created by shuilin on 05/02/2018.
//  Copyright © 2018 xuetang. All rights reserved.
//

#import "FCCallback.h"

void mainFCCallback(FCCallback callback)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback();
        }
    });
}
