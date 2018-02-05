//
//  AudioFilePlayer.m
//
//  Created by 税 on 3/28/17.


#import "AudioFilePlayer.h"
#import "AudioFilePlayerRequest.h"


@implementation AudioFilePlayer

+ (AudioFilePlayer *)fullPlayer
{
    AudioFilePlayer *player = [[AudioFilePlayer alloc] init];
    
    //构建开始请求
    {
        AudioPlayerCheckStateCondtionStartRequest *fullRequest = [AudioPlayerCheckStateCondtionStartRequest normalRequest];
        
        {
            AudioFilePlayerStartRequest *request = [AudioFilePlayerStartRequest normalRequest];
            request.player = player;
            
            fullRequest.startRequest = request;
        }
        
        {
            AudioPlayerStartCheckStateRequest *request = [AudioPlayerStartCheckStateRequest normalRequest];
            request.player = player;
            
            fullRequest.checkStateRequest = request;
        }
        
        {
            AudioPlayerStartCheckConditionRequest *request = [AudioPlayerStartCheckConditionRequest normalRequest];
            request.player = player;
            
            fullRequest.checkConditionRequest = request;
        }
        
        
        player.startRequest = fullRequest;
    }
    
    //构建停止请求
    {
        AudioPlayerCheckStateStopRequest *fullRequest = [AudioPlayerCheckStateStopRequest normalRequest];
        fullRequest.player = player;
        
        {
            AudioFilePlayerStopRequest *request = [AudioFilePlayerStopRequest normalRequest];
            request.player = player;
            fullRequest.stopRequest = request;
        }
        
        {
            AudioPlayerStopCheckStateRequest *request = [AudioPlayerStopCheckStateRequest normalRequest];
            request.player = player;
            
            fullRequest.checkStateRequest = request;
        }
        
        player.stopRequest = fullRequest;
    }
    
    return player;
}

@end



