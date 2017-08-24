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

@property (assign, nonatomic) NSUInteger startMode;//0直接启动，1检查状态启动，2检查状态和条件启动

@property (assign, nonatomic) NSUInteger stopMode;

@end



//声音播放器
@interface AudioPlayer : NSObject

/* 播放器状态，KVO */
@property (assign, nonatomic) AudioPlayer_State state;

/* 错误发生，KVO */
@property (strong, nonatomic) NSError *error;

@property (readonly, strong, nonatomic) AudioPlayerParamContext *paramContext;

- (void)start;

- (void)stop;

@end




