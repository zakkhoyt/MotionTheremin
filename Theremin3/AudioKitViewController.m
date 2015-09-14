//
//  AudioKitViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AudioKitViewController.h"
#import "AKFoundation.h"

@interface AudioKitViewController ()
@property (nonatomic, strong) AKInstrument *instrument;
@end

@implementation AudioKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.instrument = [AKInstrument instrument];
    [self.instrument setAudioOutput:[AKOscillator oscillator]];
    
    // STEP 4 : Add the instrument to the orchestra
    [AKOrchestra addInstrument:self.instrument];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleSound:(UIButton *)sender {
    if (![sender.titleLabel.text isEqual: @"Stop"]) {
        [self.instrument play];
        sender.titleLabel.text = @"Stop";
    } else {
        [self.instrument stop];
        sender.titleLabel.text = @"Play Sine Wave at 440Hz";
    }
}

@end
