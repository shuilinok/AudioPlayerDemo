//
//  ViewController.m
//  AudioPlayerDemo
//
//  Created by 税 on 25/04/2017.



#import "ViewController.h"
#import "MusicPlayer.h"
#import "SumAudioPlayerManager.h"

@interface ViewController ()

@property (strong, nonatomic) AudioPlayer *player;

@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.button setTitle:@"" forState:UIControlStateNormal];
    
    MusicPlayer *player = [self createPlayer];
    player.musicID = @"123";
    
    self.player = player;

    [player checkStart];
}

- (void)dealloc
{
    self.player = nil;
}

- (MusicPlayer *)createPlayer
{
    MusicPlayer *player = [[MusicPlayer alloc] init];
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

- (void)setPlayer:(AudioPlayer *)player
{
    [self endObserve];
    
    _player = player;
    
    [self beginObserve];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if(self.player == object)
    {
//        for(NSString *key in change)
//        {
//            NSLog(@"key : %@, object : %@",key,[change objectForKey:key]);
//        }
        
        if([keyPath isEqualToString:@"state"])
        {
            if(![self isPlaying])
            {
                //[self.button setTitle:@"开始" forState:UIControlStateNormal];
                [self.button setImage:[UIImage imageNamed:@"video_start"] forState:UIControlStateNormal];
            }
            else
            {
                //[self.button setTitle:@"停止" forState:UIControlStateNormal];
                [self.button setImage:[UIImage imageNamed:@"video_stop"] forState:UIControlStateNormal];
            }
            
            //NSLog(@"状态改变为：%ld",self.player.state);
        }
    }
}

- (BOOL)isPlaying
{
    AudioPlayer_State state = self.player.state;
    
    if(state == AudioPlayer_State_Stopped || state == AudioPlayer_State_None)
    {
        return NO;
    }
    
    return YES;
}

- (IBAction)clickButton:(id)sender
{
//    for(int i = 0; i < 10; i++)
//    {
//        [self.player checkStop];
//
//        [self.player checkStart];
//    }
    
    if(![self isPlaying])
    {
        [self.player checkStart];
    }
    else
    {
        [self.player checkStop];
    }
}

@end
