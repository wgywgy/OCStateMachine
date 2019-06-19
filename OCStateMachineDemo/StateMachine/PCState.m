//
//  PCState.m
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import "PCState.h"

@implementation PCState

+ (instancetype)state {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (BOOL)isValidNextState:(Class)stateClass {
    return YES;
}
- (void)didEnterWithPreviousState:(PCState *)previousState {
    
}
- (void)willExitWithNextState:(PCState *)nextState {
    
}
- (void)updateWithDeltaTime:(NSTimeInterval)seconds {
    
}

@end
