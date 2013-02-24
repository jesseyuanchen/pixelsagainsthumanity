//
//  BlackCardViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BlackCardViewController.h"
#import "MainViewController.h"

@interface BlackCardViewController ()

@end

@implementation BlackCardViewController

@synthesize delegate = _delegate;
@synthesize question = _question;
@synthesize card = _card;
@synthesize czar = _czar;
@synthesize doneLabel = _doneLabel;

- (BlackCardViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withCard:(NSInteger)card withCzar:(NSInteger)czar;
{
    if (self = [super init]){
        // set delegate
        self.delegate = delegate;
        // persist data so we can show it later (when the view actually loads)
        self.card = card;
        self.czar = czar;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // load question
    self.doneLabel.text = NSLocalizedString(@"DONELABEL", nil);
    self.question.text = [((MainViewController *)self.delegate).deckManager.blackCards objectAtIndex:self.card];
    // alert czar to read it out loud
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"NEWCARDCZAR", nil)
                                                      message:[NSString stringWithFormat:NSLocalizedString(@"CZARINSTRUCTIONS", nil), [((MainViewController *)self.delegate).userManager.userNames objectAtIndex:self.czar]]
                                                     delegate:nil
                                            cancelButtonTitle:NSLocalizedString(@"CANCELBUTTON", nil)
                                            otherButtonTitles:nil];
    [message show];
}

- (IBAction)done
{
    [self.delegate dismissModalView:@"blackCard" withFlag:FALSE];
}

@end
