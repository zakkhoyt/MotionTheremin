//
//  ContinuousViewController.m
//  Theremin3
//
//  Created by Zakk Hoyt on 9/14/15.
//  Copyright © 2015 Zakk Hoyt. All rights reserved.
//

#import "ContinuousViewController.h"
#import "AKAudioOutputPlot.h"

#import "AKTools.h"
#import "ContinuousControlConductor.h"


@interface ContinuousViewController ()

@end

@implementation ContinuousViewController{
    IBOutlet AKPropertySlider *amplitudeSlider;
    IBOutlet AKPropertySlider *modulationSlider;
    IBOutlet AKPropertySlider *modIndexSlider;
    IBOutlet AKPropertyLabel *amplitudeLabel;
    IBOutlet AKPropertyLabel *modulationLabel;
    IBOutlet AKPropertyLabel *modIndexLabel;
    IBOutlet AKAudioOutputPlot *plot;
    
    ContinuousControlConductor *conductor;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    conductor = [[ContinuousControlConductor alloc] init];
    
    amplitudeSlider.property  = amplitudeLabel.property  = conductor.tweakableInstrument.amplitude;
    modulationSlider.property = modulationLabel.property = conductor.tweakableInstrument.modulation;
    modIndexSlider.property   = modIndexLabel.property   = conductor.tweakableInstrument.modIndex;
    
    [AKManager addBinding:plot];
}

- (void)viewDidDisappear:(BOOL)animated {
    [conductor stop];
}

- (IBAction)runInstrument:(id)sender {
    [conductor start];
}

- (IBAction)stopInstrument:(id)sender {
    [conductor stop];
}


@end
