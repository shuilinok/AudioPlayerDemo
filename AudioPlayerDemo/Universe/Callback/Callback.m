//
//  Callback.m
//  Producer
//
//  Created by shuilin on 8/18/16.
//  Copyright © 2016 xuetang. All rights reserved.
//

#import "Callback.h"

void mainResultCallback(ResultCallback callback, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(error);
        }
    });
}

void mainDataResultCallback(DataResultCallback callback, id data, NSError *error)
{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (callback)
        {
            callback(data,error);
        }
    });
}
