//
//  ViewController.m
//  AudioPlayerDemo
//
//  Created by 税 on 25/04/2017.



#import "ViewController.h"
#import "AudioFilePlayer.h"
#import "SumAudioPlayerManager.h"

@interface ViewController ()

@property (strong, nonatomic) AudioFilePlayer *player;

@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *url = @"http://www.xxx.com/test.mp3";
    
    AudioFilePlayer *player = [self createPlayer];
    player.url = url;
    
    self.player = player;

    [player checkStart];
}

- (void)dealloc
{
    self.player = nil;
}

- (AudioFilePlayer *)createPlayer
{
    AudioFilePlayer *player = [[AudioFilePlayer alloc] init];
    player.delegate = [SumAudioPlayerManager sharedInstance];
    
    return player;
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

- (void)setPlayer:(AudioFilePlayer *)player
{
    [self endObserve];
    
    _player = player;
    
    [self beginObserve];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(self.player == object)
    {
        if([keyPath isEqualToString:@"state"])
        {
            AudioPlayer_State state = self.player.state;
            NSLog(@"状态改变为：%ld",state);
        }
    }
}

- (IBAction)clickButton:(id)sender
{
    for(NSInteger i = 0; i < 10; i++)
    {
        [self.player checkStart];
        
        [self.player checkStop];
    }
}

@end
