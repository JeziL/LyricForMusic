//
//  ViewController.h
//  LyricForMusic
//
//  Created by JL-THU on 15/7/26.
//  Copyright © 2015年 EZI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *switcher;
@property (strong, nonatomic) IBOutlet UISwitch *copyable;
@property (strong, nonatomic) IBOutlet UISlider *textSize;
@property (strong, nonatomic) IBOutlet UITextView *egTextView;
@property (strong, nonatomic) IBOutlet UILabel *textSizeValue;

- (IBAction)followMe:(id)sender;
- (IBAction)donateMe:(id)sender;


- (IBAction)switcherChaned:(id)sender;
- (IBAction)copyableChanged:(id)sender;
- (IBAction)textSizeChanged:(id)sender;

@end

