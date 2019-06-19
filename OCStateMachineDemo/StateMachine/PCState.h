//
//  PCState.h
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PCStateMachine;

NS_ASSUME_NONNULL_BEGIN

@interface PCState : NSObject

/**
 * The state machine that this state is associated with.
 * This is nil if this state hasn't been added to a state machine yet.
 */
@property (nullable, nonatomic, weak) PCStateMachine *stateMachine;


/**
 * Creates a new state to be used in a state machine.
 *
 * @see GKStateMachine
 */
+ (instancetype)state;
- (instancetype)init NS_DESIGNATED_INITIALIZER;

- (BOOL)isValidNextState:(Class)stateClass;
- (void)didEnterWithPreviousState:(PCState *)previousState;
- (void)updateWithDeltaTime:(NSTimeInterval)seconds;
- (void)willExitWithNextState:(PCState *)nextState;


@end

NS_ASSUME_NONNULL_END
