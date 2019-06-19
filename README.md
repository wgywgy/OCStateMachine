# OCStateMachine
A simple StateMachine written in objective c.

中文博客说明：https://www.jianshu.com/p/8e3c01ecb640


It contain two main Class:
PCState: a state class which define the basic behavior of state
PCStateMachine: a class which combine state and provide method to trans state and tell user can trans state.

It use Like GKStateMachine, But support lower iOS Version, Hope use happy.

How to Use:

##### Step 1:
You can define subclass of PCState:
```
@implementation PCGreenState
- (BOOL)isValidNextState:(Class)stateClass {
    return stateClass == PCYellowState.class;
}

- (void)didEnterWithPreviousState:(PCState *)previousState {
    NSLog(@"💚");
}
@end
```

##### Step 2:
Combine StateMachine with state:
```
// Create the states
PCGreenState *greenState = [PCGreenState new];
PCYellowState *yellowState = [PCYellowState new];
PCRedState *redState = [PCRedState new];

// Initialize the state machine
PCStateMachine *stateMachine = [PCStateMachine stateMachineWithStates:@[greenState, yellowState, redState]];
```

At Now you can use StateMachine like this:
```
// Try entering various states...
if (![stateMachine enterState:PCGreenState.class]) {
    NSLog(@"failed to move to green");
}

if (![stateMachine enterState:PCRedState.class]) {
    NSLog(@"failed to move to red");
}
```
