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


@interface AudioKitViewController () /*<UIViewControllerPreviewingDelegate>*/{
    Conductor *conductor;
}

@property (nonatomic, strong) AKInstrument *instrument;
@property (nonatomic, strong) AKOscillator *oscillator;
@end

@implementation AudioKitViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    conductor = [[Conductor alloc] init];
}

- (IBAction)keyPressed:(id)sender
{
//    UILabel *key = (UILabel *)sender;
//    NSInteger index = [key tag];
//    [key setBackgroundColor:[UIColor redColor]];
//    [conductor play:index];
    
    
    for(NSUInteger index = 0; index < 12; index++){
        [conductor play:index];
        usleep(1 * 1000 * 250);
        [conductor release:index];
    }
}

- (IBAction)keyReleased:(id)sender
{
    UILabel *key = (UILabel *)sender;
    NSInteger index = [key tag];
    if ((index == 1) || (index == 3) || (index == 6) || (index == 8) || (index == 10)) {
        [key setBackgroundColor:[UIColor blackColor]];
    } else {
        [key setBackgroundColor:[UIColor whiteColor]];
    }
    [conductor release:index];
}

- (IBAction)reverbSliderValueChanged:(id)sender
{
    [conductor setReverbFeedbackLevel:[(UISlider *)sender value]];
}

- (IBAction)toneColorSliderValueChanged:(id)sender
{
    [conductor setToneColor:[(UISlider *)sender value]];
}



//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//
////    // STEP 3 : Define the instrument as a simple oscillator
////    self.instrument = [AKInstrument instrument];
////    AKOscillator *o = [AKOscillator oscillator];
////    AKParameter *f = [AKParameter parameterWithString:@"f"];
////    f.value = 88;
////    o.frequency = f;
//////    AKConstant *c = [AKConstant parameterWithString:@"c"];
//////    c.value = 88;
//////    o.frequency = c;
////    
////    [self.instrument setAudioOutput:o];
////    
////    // STEP 4 : Add the instrument to the orchestra
////    [AKOrchestra addInstrument:self.instrument];
//    
//    
//    self.oscillator = [AKOscillator oscillator];
//    AKParameter *frequency = [AKParameter parameterWithString:@"Frequency"];
//    frequency.value = 440;
////    [self.oscillator setFrequency:frequency];
//    
//    self.instrument = [AKInstrument instrument];
//    [self.instrument setAudioOutput:self.oscillator];
//    
//    
//    // STEP 4 : Add the instrument to the orchestra
//    [AKOrchestra addInstrument:self.instrument];
//    
//    
//    
////    ToneGeneratorNote *note = [[ToneGeneratorNote alloc] init];
////    _toneColor  = [[AKInstrumentProperty alloc] initWithValue:0.5
////                                                      minimum:0.1
////                                                      maximum:1.0];
////    [self addProperty:_toneColor];
////    
////    AKFMOscillator *fmOscillator = [AKFMOscillator oscillator];
////    fmOscillator.baseFrequency = note.frequency;
////    fmOscillator.carrierMultiplier = [_toneColor scaledBy:akp(20)];
////    fmOscillator.modulatingMultiplier = [_toneColor scaledBy:akp(12)];
////    fmOscillator.modulationIndex = [_toneColor scaledBy:akp(12)];
////    fmOscillator.amplitude = akp(0.15);
//    
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//- (IBAction)toggleSound:(UIButton *)sender {
//    if (![sender.titleLabel.text isEqual: @"Stop"]) {
//        [self.instrument play];
////        sender.titleLabel.text = @"Stop";
//        [sender setTitle:@"Stop" forState:UIControlStateNormal];
//    } else {
//        [self.instrument stop];
////        sender.titleLabel.text = @"Play Sine Wave at 440Hz";
//        [sender setTitle:@"Play Sine Wave at 440Hz" forState:UIControlStateNormal];
//    }
//    [sender layoutSubviews];
//    
// 
//}
//
//
////-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
////    UITouch *touch = [touches anyObject];
////    touch.force;
////    r45n`1m2 34578i9oi8765 4j
////}
//
//- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location NS_AVAILABLE_IOS(9_0){
//    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"3d"];
//    return vc;
//    
//}
//- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit NS_AVAILABLE_IOS(9_0){
//    
//}

@end
