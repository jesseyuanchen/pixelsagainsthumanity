//
//  project3ApplicationTests.m
//  project3ApplicationTests
//
//  Created by Jack Chen on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "project3ApplicationTests.h"
#import "AppDelegate.h"
#import "MainViewController.h"

@implementation project3ApplicationTests

@synthesize appDelegate = _appDelegate;
@synthesize mainViewController = _mainViewController;
@synthesize view = _view;

- (void)setUp
{
    [super setUp];
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    self.mainViewController = self.appDelegate.mainViewController; 
    self.view = self.mainViewController.view;
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testAppDelegate
{
    STAssertNotNil(self.appDelegate, @"Cannot find the application delegate!");
}

- (void)testSplashScreenLoading
{
    STAssertTrue(self.mainViewController.isViewLoaded && self.mainViewController.view.window, @"The view did not load");          
}

- (void)testPlayerSelection
{
    // TODO
}

- (void)testGameplay
{
    // TODO
}

- (void)testExample
{
    // STFail(@"Unit tests are not implemented yet in project3ApplicationTests");
}

@end
