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

@interface AudioPlayerParamContext : NSObject

@property (strong, nonatomic) NSString *startActionName;

@property (strong, nonatomic) NSString *stopActionName;

@end



//声音播放器
@interface AudioPlayer : NSObject

/* 播放器状态，KVO */
@property (assign, nonatomic) AudioPlayer_State state;

/* 错误发生，KVO */
@property (strong, nonatomic) NSError *error;

@property (strong, nonatomic) AudioPlayerParamContext *paramContext;

@property (readonly, strong, nonatomic) MCAction *startAction;

@property (readonly, strong, nonatomic) MCAction *stopAction;

- (void)start;

- (void)stop;

@end




