//
//  ViewController.m
//  AudioPlayerDemo
//
//  Created by 税 on 25/04/2017.



#import "ViewController.h"
#import "NormalAudioFilePlayer.h"

@interface ViewController ()
@property (strong, nonatomic) NormalAudioFilePlayer *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *url = @"http://www.xxx.com/test.mp3";
    
    NormalAudioFilePlayer *player = [NormalAudioFilePlayer createWithUrl:url];
    self.player = player;
    
    [player start];
    
}

- (void)dealloc
{
    self.player = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//开始观察
- (void)beginObserve
{
    id temp = _player;
    [temp addObserver:self forKeyPath:@"state" options:NSKeyValueObservingOptionNew context:NULL];
}

//结束观察
- (void)endObserve
{
    id temp = _player;
    [temp removeObserver:self forKeyPath:@"state" context:NULL];
}

- (void)setPlayer:(NormalAudioFilePlayer *)player
{
    [self endObserve];
    
    _player = player;
    
    [self beginObserve];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if([self.player isEqual:object])
    {
        if([keyPath isEqualToString:@"state"])
        {
            id<AudioPlayerState> state = self.player.state;
            NSLog(@"状态改变为：%@",state);
        }
    }
}

@end