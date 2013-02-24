//
//  SetUpViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SetUpViewController.h"
#import "MainViewController.h"

@interface SetUpViewController ()

@end

@implementation SetUpViewController

@synthesize delegate = _delegate;
@synthesize userQuestionLabel = _userQuestionLabel;
@synthesize continueLabel = _continueLabel;
@synthesize userQuestionField = _userQuestionField;
@synthesize usersToGetInputFrom = _usersToGetInputFrom;
@synthesize usersGottenInputFrom = _usersGottenInputFrom;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Find out how many usernames we need
    self.continueLabel.text = NSLocalizedString(@"DONE", nil);
    self.usersGottenInputFrom = 0;
    self.usersToGetInputFrom = ((MainViewController *)self.delegate).userManager.amountOfUsers;
    // set first responder as the field
    [self.userQuestionField becomeFirstResponder];
    // set up first user
    [self getNameOfNextUser];
}

- (void)getNameOfNextUser
{
    self.userQuestionLabel.text = [NSString stringWithFormat:NSLocalizedString(@"USERQUESTION", nil), self.usersGottenInputFrom];
    self.userQuestionField.text = nil;
}

- (IBAction)submitName:(id)sender
{
    // submit name for later use
    [((MainViewController *)self.delegate).userManager giveUser:self.usersGottenInputFrom theName:self.userQuestionField.text];
    // incriment users gotton names from
    self.usersGottenInputFrom++;
    // figure out if need to get another name or can return control
    if (self.usersGottenInputFrom < self.usersToGetInputFrom){
        [self getNameOfNextUser];
    }
    else {
        [self done];
    }
}

- (void)done
{
    [self.delegate dismissModalView:@"setup" withFlag:NO];
}

@end
