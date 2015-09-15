//
//  HarmonizerViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "HarmonizerViewController.h"
#import "AKFoundation.h"
#import "HarmonizerInstrument.h"
#import "AKSampler.h"


@interface HarmonizerViewController ()

@end

@implementation HarmonizerViewController {
    HarmonizerInstrument *harmonizer;
    AKSampler *sampler;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    sampler = [[AKSampler alloc] init];
    harmonizer = [[HarmonizerInstrument alloc] init];
    [AKOrchestra addInstrument:harmonizer];
    [AKOrchestra start];
}

- (IBAction)startRecording:(id)sender {
    [harmonizer play];
    [sampler startRecordingToTrack:@"harmonizer"];
}
- (IBAction)stopRecording:(id)sender {
    [harmonizer stop];
    [sampler stopRecordingToTrack:@"harmonizer"];
}

- (IBAction)startPlaying:(id)sender {
    [sampler startPlayingTrack:@"harmonizer"];
}
- (IBAction)stopPlaying:(id)sender {
    [sampler stopPlayingTrack:@"harmonizer"];
}


@end
