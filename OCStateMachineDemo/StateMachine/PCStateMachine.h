//
//  PCStateMachine.h
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PCState.h"

NS_ASSUME_NONNULL_BEGIN

@interface PCStateMachine : NSObject

@property (nullable, nonatomic, readonly) PCState* currentState;

/**
 * Creates a state machine with an array of possible states and an initial state.
 *
 * @param states a list of possible states for this state machine.
 */
+ (instancetype)stateMachineWithStates:(NSArray<PCState *> *)states;
- (instancetype)initWithStates:(NSArray<PCState *> *)states NS_DESIGNATED_INITIALIZER;

- (instancetype)init NS_UNAVAILABLE;

- (BOOL)canEnterState:(Class)stateClass;
- (BOOL)enterState:(Class)stateClass;

- (nullable PCState*)stateForClass:(Class)stateClass;

@end

NS_ASSUME_NONNULL_END
