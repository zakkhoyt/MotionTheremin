//
//  AudioKitViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "AudioKitViewController.h"
#import "AKFoundation.h"

#import "AKFoundation.h"
#import "Conductor.h"

#import "NSTimer+Blocks.h"

@interface AudioKitViewController ()

@property (nonatomic, strong) Conductor *conductor;
@end

@implementation AudioKitViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.conductor = [[Conductor alloc] init];
}

- (IBAction)keyPressed:(id)sender
{
    
    __block NSInteger index = 0;
    
    [NSTimer immediateRepeatingTimerWithTimeInterval:0.05 timerBlock:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
            [self.conductor play:index];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dispatch_semaphore_signal(semaphore);
            });
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [self.conductor release:index++];
            
            if(index == 11){
                index = 0;
            }
        });
    }];
}

- (IBAction)keyReleased:(id)sender {
    UILabel *key = (UILabel *)sender;
    NSInteger index = [key tag];
    if ((index == 1) || (index == 3) || (index == 6) || (index == 8) || (index == 10)) {
        [key setBackgroundColor:[UIColor blackColor]];
    } else {
        [key setBackgroundColor:[UIColor whiteColor]];
    }
    [self.conductor release:index];
}

- (IBAction)reverbSliderValueChanged:(id)sender {
    [self.conductor setReverbFeedbackLevel:[(UISlider *)sender value]];
}

- (IBAction)toneColorSliderValueChanged:(id)sender {
    [self.conductor setToneColor:[(UISlider *)sender value]];
}


@end
