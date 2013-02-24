//
//  InstructionViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "InstructionViewController.h"

@interface InstructionViewController ()

@end

@implementation InstructionViewController

@synthesize instructionText = _instructionText; 
@synthesize delegate = _delegate;

- (IBAction)done:(id)sender
{
    [self.delegate dismissModalView:@"instructions" withFlag:FALSE];
}

- (void)viewDidLoad
{
    self.instructionText.text = NSLocalizedString(@"INSTRUCTIONSTEXT", nil);    
}

@end
