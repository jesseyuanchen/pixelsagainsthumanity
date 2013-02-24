//
//  SplashScreenViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "MainViewController.h"
#import "InstructionViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

@synthesize delegate = _delegate;
@synthesize slider = _slider;
@synthesize sliderLabel = _sliderLabel;
@synthesize familyFriendlySwitch = _familyFriendlySwitch;
@synthesize playLabel = _playLabel;
@synthesize playersLabel = _playersLabel;
@synthesize familyLabel = _familyLabel;
@synthesize instructionsLabel = _instructionsLabel;
@synthesize websiteLabel = _websiteLabel;
@synthesize amazonLabel = _amazonLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.playLabel.text = NSLocalizedString(@"START_GAME", nil);
    self.playersLabel.text = NSLocalizedString(@"NUM_PLAYERS", nil);
    self.familyLabel.text = NSLocalizedString(@"MODE", nil);
    self.instructionsLabel.text = NSLocalizedString(@"INSTRUCTIONS", nil);
    self.websiteLabel.text = NSLocalizedString(@"WEBSITE", nil);
    self.amazonLabel.text = NSLocalizedString(@"AMAZON", nil);
}

- (IBAction)updateSliderLabel:(UISlider *)sender
{
    self.sliderLabel.text = [NSString stringWithFormat:@"%d", (int) self.slider.value];
}

- (IBAction)done:(id)sender
{
    // update managers accordingly
    ((MainViewController *)self.delegate).userManager.amountOfUsers = (int) self.slider.value;
    ((MainViewController *)self.delegate).turnManager.amountOfUsers = (int) self.slider.value;
    [((MainViewController *)self.delegate).deckManager makeDeckWithFamilyFriendlyMode:self.familyFriendlySwitch.on];
    // dismiss self
    [self.delegate dismissModalView:@"splash" withFlag:NO];
}

- (void)dismissModalView:(NSString *)whichView withFlag:(BOOL)flag
{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showInstructions:(id)sender
{
    InstructionViewController *controller = [[InstructionViewController alloc] init];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

- (IBAction)showAmazon:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.amazon.com/Cards-Against-Humanity-LLC/dp/B004S8F7QM"]];
}

- (IBAction)showWebsite:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://cardsagainsthumanity.com/"]];
}

@end
