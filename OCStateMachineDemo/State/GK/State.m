//
//  State.m
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import "State.h"

@implementation GreenState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == YellowState.class;
}

- (void)didEnterWithPreviousState:(GKState *)previousState {
    NSLog(@"💚");
}
@end

@implementation YellowState
- (BOOL)isValidNextState:(Class)stateClass {
     return stateClass == RedState.class;
}

- (void)didEnterWithPreviousState:(GKState *)previousState {
    NSLog(@"💛");
}
@end

@implementation RedState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == GreenState.class;
}

- (void)didEnterWithPreviousState:(GKState *)previousState {
    NSLog(@"❤️");
}
@end
