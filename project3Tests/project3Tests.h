//
//  project3ApplicationTests.h
//  project3ApplicationTests
//
//  Created by Jack Chen on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "AppDelegate.h"
#import "MainViewController.h"

@class ViewController;

@interface project3ApplicationTests : SenTestCase

@property (nonatomic, readwrite, weak) AppDelegate *appDelegate;
@property (nonatomic, readwrite, weak) MainViewController *mainViewController;
@property (nonatomic, readwrite, weak) UIView *view;

@end
