//
//  AudioPlayer.h
//  Created by 税 on 3/28/17.


#import <Foundation/Foundation.h>


//播放器状态
typedef NS_ENUM(NSUInteger, AudioPlayer_State) {
    AudioPlayer_State_None = 0,        //初始状态
    AudioPlayer_State_Starting,        //启动中
    AudioPlayer_State_Started,         //已启动
    AudioPlayer_State_Stopping,        //停止中
    AudioPlayer_State_Stopped,         //已停止
};

@protocol AudioPlayerManager;

//声音播放器
@interface AudioPlayer : NSObject

/* 播放器状态，KVO */
@property (assign, nonatomic) AudioPlayer_State state;

/* 错误发生，KVO */
@property (strong, nonatomic) NSError *error;

@property (weak, nonatomic) id<AudioPlayerManager> manager;//默认nil，直接执行

//外部调用
- (void)prepareStart:(FCCallback)callback;

- (void)prepareStop:(FCCallback)callback;

@end


//管理器调用
@interface AudioPlayer (Manager)

- (void)start:(FCCallback)callback;

- (void)stop:(FCCallback)callback;

- (void)cancelStart;

@end


//子类实现
@interface AudioPlayer (SubImp)

- (void)impStart:(FCRequest *)request;

- (void)impStop:(FCRequest *)request;

@end



