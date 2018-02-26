//
//  main.m
//  AudioPlayerDemo
//
//  Created by shuilin on 25/04/2017.


#import <UIKit/UIKit.h>
#import "AppDelegate.h"


//request用block方式实现，减少新建请求类；
//request属性不对外暴露；
//start等到已启动才返回；

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
