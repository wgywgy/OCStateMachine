//
//  PCStateMachine.m
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import "PCStateMachine.h"
@interface PCStateMachine()
@property(nonatomic, strong) PCState *currentState;
@property(nonatomic, strong) NSMapTable *states;
//private(set) var currentState: EHState?
//    private let states = NSMapTable<AnyObject, EHState>(keyOptions: [.objectPointerPersonality],
//                                                        valueOptions: [.strongMemory])

@end
@implementation PCStateMachine

+ (instancetype)stateMachineWithStates:(NSArray<PCState *> *)states {
    return [[self alloc] initWithStates:states];
}

- (instancetype)initWithStates:(NSArray <PCState *> *)states {
    NSAssert(states.count > 0, @"Can't create state machine with zero states.");
    self = [super init];
    if (self) {
        self.states = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsObjectPersonality valueOptions:NSPointerFunctionsStrongMemory];
        NSHashTable *tempStates = [NSHashTable hashTableWithOptions:NSPointerFunctionsObjectPointerPersonality];
        
        for (PCState *state in states) {
            if ([tempStates containsObject:state.class]) {
                NSLog(@"!!Duplicate instances of %@ found.", state.class);
            } else {
                [tempStates addObject:state.class];
            }
        }
        
        for (PCState *state in states) {
            state.stateMachine = self;
            [self.states setObject:state forKey:state.class];
        }

    }
    return self;
}

- (BOOL)canEnterState:(Class)stateClass {
    if ([self.states objectForKey:stateClass] == nil) {
        return NO;
    }
    
    if (self.currentState == nil) {
        return YES;
    }
    
    return [self.currentState isValidNextState:stateClass];
}

- (BOOL)enterState:(Class)stateClass {
    if (![self canEnterState:stateClass]) {
        return NO;
    }
    
    PCState *previousState = self.currentState;
    PCState *nextState = [self.states objectForKey:stateClass];
    
    [previousState willExitWithNextState:nextState];
    self.currentState = nextState;
    [self.currentState didEnterWithPreviousState:previousState];
    
    return YES;
}

- (void)updateDeltaTime:(NSTimeInterval)seconds {
    [self.currentState updateWithDeltaTime:seconds];
}

- (nullable PCState*)stateForClass:(Class)stateClass {
    return [self.states objectForKey:stateClass];
}

@end

