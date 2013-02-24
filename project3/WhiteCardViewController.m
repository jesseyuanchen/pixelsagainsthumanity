//
//  CardViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhiteCardViewController.h"

@interface WhiteCardViewController ()

@end

@implementation WhiteCardViewController

@synthesize delegate = _delegate;
@synthesize answer = _answer; 
@synthesize card = _card;
@synthesize backLabel = _backLabel;
@synthesize pickLabel = _pickLabel;

- (WhiteCardViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withCardText:(NSString *)card
{
    if (self = [super init]){
        self.delegate = delegate;
        self.card = card;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set question to text
    self.answer.text = self.card;
    self.backLabel.text = NSLocalizedString(@"BACKLABEL", nil);
    self.pickLabel.text = NSLocalizedString(@"PICKLABEL", nil);
}

- (IBAction)back:(id)sender
{
    [self doneAndUserDidPick:NO];
}

- (IBAction)select:(id)sender
{
    [self doneAndUserDidPick:YES];
}

- (void)doneAndUserDidPick:(BOOL)userPicked
{
    [self.delegate dismissModalView:@"whiteCard" withFlag:userPicked];
}

@end
