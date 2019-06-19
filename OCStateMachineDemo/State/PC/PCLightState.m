//
//  PCLightState.m
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/29.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import "PCLightState.h"

@implementation PCGreenState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCYellowState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    NSLog(@"💚");
}
@end

@implementation PCYellowState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCRedState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    NSLog(@"💛");
}
@end

@implementation PCRedState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCGreenState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    NSLog(@"❤️");
}
@end
