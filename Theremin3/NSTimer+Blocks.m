//
//  NSTimer+Blocks.m
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "NSTimer+Blocks.h"

@implementation NSTimer (Blocks)

+(id)repeatingTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock{
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval timerBlock:timerBlock repeats:YES];
}
+(id)immediateRepeatingTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock{
    if(timerBlock){
        timerBlock();
    }
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval timerBlock:timerBlock repeats:YES];
}
+(id)oneShotTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock{
    return [NSTimer scheduledTimerWithTimeInterval:timeInterval timerBlock:timerBlock repeats:NO];
}



+(id)scheduledTimerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock repeats:(BOOL)inRepeats {
    void (^block)() = [timerBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(id)timerWithTimeInterval:(NSTimeInterval)timeInterval timerBlock:(NSTimerBlock)timerBlock repeats:(BOOL)inRepeats {
    void (^block)() = [timerBlock copy];
    id ret = [self timerWithTimeInterval:timeInterval target:self selector:@selector(jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+(void)jdExecuteSimpleBlock:(NSTimer *)inTimer; {
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
