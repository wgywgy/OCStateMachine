//
//  ViewController.m
//  OCStateMachineDemo
//
//  Created by wuguanyu on 2019/5/28.
//  Copyright © 2019 HIHome. All rights reserved.
//

#import "ViewController.h"
#import "State.h"

#import "PCLightState.h"
#import "PCStateMachine.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self testGKState];
    [self testPCState];
    
}

- (void)testPCState {
    // Create the states
    PCGreenState *greenState = [PCGreenState new];
    PCYellowState *yellowState = [PCYellowState new];
    PCRedState *redState = [PCRedState new];
    
    // Initialize the state machine
    PCStateMachine *stateMachine = [PCStateMachine stateMachineWithStates:@[greenState, yellowState, redState]];
    
    // Try entering various states...
    if (![stateMachine enterState:PCGreenState.class]) {
        NSLog(@"failed to move to green");
    }
    
    if (![stateMachine enterState:PCRedState.class]) {
        NSLog(@"failed to move to red");
    }
    
    if (![stateMachine enterState:PCYellowState.class]) {
        NSLog(@"failed to move to yellow");
    }
    
    if (![stateMachine enterState:PCGreenState.class]) {
        NSLog(@"failed to move to green");
    }
    
    if (![stateMachine enterState:PCRedState.class]) {
        NSLog(@"failed to move to red");
    }
}

- (void)testGKState {
    // Create the states
    GreenState *greenState = [GreenState new];
    YellowState *yellowState = [YellowState new];
    RedState *redState = [RedState new];
    
    // Initialize the state machine
    GKStateMachine *stateMachine = [GKStateMachine stateMachineWithStates:@[greenState, yellowState, redState]];
    
    // Try entering various states...
    if (![stateMachine enterState:GreenState.class]) {
        NSLog(@"failed to move to green");
    }
    
    if (![stateMachine enterState:RedState.class]) {
        NSLog(@"failed to move to red");
    }
    
    if (![stateMachine enterState:YellowState.class]) {
        NSLog(@"failed to move to yellow");
    }
    
    if (![stateMachine enterState:GreenState.class]) {
        NSLog(@"failed to move to green");
    }
    
    if (![stateMachine enterState:RedState.class]) {
        NSLog(@"failed to move to red");
    }
}

@end
