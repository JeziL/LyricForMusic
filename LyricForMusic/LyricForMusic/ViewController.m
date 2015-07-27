//
//  ViewController.m
//  LyricForMusic
//
//  Created by JL-THU on 15/7/26.
//  Copyright © 2015年 EZI. All rights reserved.
//

#import "ViewController.h"

#define egText @"If you like this tweak, \n\nplease consider to make a donation.\n\nThat will help me a lot."
#define myTwitterWeb @"https://twitter.com/EZIdev"
#define myTwitterApp @"twitter:///user?screen_name=EZIdev"
#define donateURL @"http://ezidev.tumblr.com/post/124997910493/donation"

@interface ViewController () {
    BOOL _enabled;
    BOOL _copyable;
    float _textSize;
}

@end

@implementation ViewController

@synthesize switcher;
@synthesize copyable;
@synthesize textSize;
@synthesize egTextView;
@synthesize textSizeValue;

-(void)loadPrefs {
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc]initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        _enabled = [unarchiver decodeBoolForKey:@"Enabled"];
        _copyable = [unarchiver decodeBoolForKey:@"Copyable"];
        _textSize = [unarchiver decodeFloatForKey:@"TextSize"];
        [unarchiver finishDecoding];
    }
    else {
        _enabled = YES;
        _copyable = YES;
        _textSize = 17.0;
    }
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    if((self =[super initWithCoder:aDecoder])){
        [self loadPrefs];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    switcher.on = _enabled;
    copyable.on = _copyable;
    textSize.value = _textSize;
    [egTextView setFont:[UIFont fontWithName:@"Arial" size:_textSize]];
    egTextView.text = egText;
    textSizeValue.text = [[NSString alloc]initWithFormat:@"%d", (int)_textSize];
}

//-(NSString*)documentsDirectory{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                         NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths firstObject];
//    return documentsDirectory;
//}

-(NSString*)dataFilePath{
    return [[NSString alloc]initWithFormat:@"/var/mobile/Library/Preferences/com.ezi.lyricformusic.plist"];
}

-(void)savePrefs{
    NSMutableData *data = [[NSMutableData alloc]init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeBool:_enabled forKey:@"Enabled"];
    [archiver encodeBool:_copyable forKey:@"Copyable"];
    [archiver encodeFloat:_textSize forKey:@"TextSize"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)followMe:(id)sender {
    NSURL *myTwitterUrlScheme = [NSURL URLWithString:myTwitterApp];
    if ([[UIApplication sharedApplication] canOpenURL:myTwitterUrlScheme])
        [[UIApplication sharedApplication] openURL:myTwitterUrlScheme];
    else
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:myTwitterWeb]];
}

- (IBAction)donateMe:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:donateURL]];
}

- (IBAction)switcherChaned:(id)sender {
    _enabled = switcher.on;
    [self savePrefs];
}
- (IBAction)copyableChanged:(id)sender {
    _copyable = copyable.on;
    [self savePrefs];
}

- (IBAction)textSizeChanged:(id)sender {
    _textSize = textSize.value;
    textSizeValue.text = [[NSString alloc]initWithFormat:@"%d", (int)textSize.value];
    [egTextView setFont:[UIFont fontWithName:@"Arial" size:textSize.value]];
    egTextView.text = @"";
    egTextView.text = egText;
    [self savePrefs];
}
@end
