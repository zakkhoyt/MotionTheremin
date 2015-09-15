//
//  NSTimer+Blocks.h
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NSTimerBlock)();
@interface NSTimer (Blocks)

+(id)repeatingTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock;
+(id)immediateRepeatingTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock;
+(id)oneShotTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock;

+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock repeats:(BOOL)inRepeats;
+(id)timerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock repeats:(BOOL)inRepeats;
@end
