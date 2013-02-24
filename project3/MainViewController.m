//
//  MainViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "SetUpViewController.h"
#import "BlackCardViewController.h"
#import "SplashScreenViewController.h"
#import "HandViewController.h"
#import "ScoreViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - sythesize models

@synthesize userManager = _userManager;
@synthesize turnManager = _turnManager;
@synthesize currentTurnManager = _currentTurnManager;
@synthesize deckManager = _deckManager;
@synthesize firstLoad = _firstLoad;
@synthesize nextStep = _nextStep;


#pragma mark - View Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // establish that first time loading
    self.firstLoad = YES;
    // NOTE: cannot call game init here because I can't load another view until after viewDidAppear
}
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // check if first load, if so than start game
    if (self.firstLoad){
        // say that no longer first load
        self.firstLoad = NO;
        // begin game
        [self gameInit];
    }
    else {
        [self executeNextStep];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
#pragma mark - Game cycle

- (void)gameInit
{
    // create managers
    self.userManager = [[UserManager alloc] init];
    self.turnManager = [[TurnManager alloc] init];
    self.deckManager = [[DeckManager alloc] init];
    self.currentTurnManager = [[CurrentTurnManager alloc] init];
    // show the user the splash screen
    SplashScreenViewController *controller = [[SplashScreenViewController alloc] init];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

- (void)emptyDeck
{
    // alert user about the error
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Uh oh..."
                                                      message:@"Looks like the Deck is empty..."
                                                     delegate:nil
                                            cancelButtonTitle:@"Aww, well start a new game then!"
                                            otherButtonTitles:nil];
    [message show];
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    // could only be called after emptyDeck, so begin a new game
    [self gameInit];
}

- (void)executeNextStep
{
    // ok figure out next step
    if ([self.nextStep isEqualToString:@"getNames"]){
        // redirect straight to set up screen so I can get user names
        SetUpViewController *controller = [[SetUpViewController alloc] init];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    }
    if ([self.nextStep isEqualToString:@"startRound"]){
        // empty vars from last round
        self.currentTurnManager.currentQuestion = 0;
        [self.currentTurnManager.cardsPlayed removeAllObjects];
        // draw question
        self.currentTurnManager.currentQuestion = [self.deckManager drawCardWhichIsWhite:NO];
        // make sure question exists
        if (self.currentTurnManager.currentQuestion == -1){
            // drop error
            [self emptyDeck];
            return;
        }
        // get next card czar and start round
        [self.turnManager getNextCardCzarAndStartRound];
        // tell card czar to read question
        BlackCardViewController *controller = [[BlackCardViewController alloc] initWithDelegate:self withCard:self.currentTurnManager.currentQuestion withCzar:self.turnManager.lastCardCzar];
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    }
    if ([self.nextStep isEqualToString:@"nextTurn"]){
        // get next player
        NSInteger nextUser = [self.turnManager getNextUserToGo];
        // while their hand is less than 10 cars draw a card
        while ([(NSMutableArray *)[self.userManager.userHands objectAtIndex:nextUser] count] < 10){
            // draw card
            NSInteger drawnCard = [self.deckManager drawCardWhichIsWhite:YES];
            // check to make sure that the deck manager isn't telling us the deck is empty
            if (drawnCard == -1){
                [self emptyDeck];
                return;
            }
            // add card to user hand
            [(NSMutableArray *)[self.userManager.userHands objectAtIndex:nextUser] addObject:[NSNumber numberWithInt:drawnCard]];
        }
        // init view with all necessary data and show user their hand
        HandViewController *controller = [[HandViewController alloc] initWithDelegate:self 
                                                                             withUser:nextUser 
                                                                         withQuestion:self.currentTurnManager.currentQuestion 
                                                                       isCardCzarPick:FALSE];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    }
    if ([self.nextStep isEqualToString:@"cardCzarPick"]){
        HandViewController *controller = [[HandViewController alloc] initWithDelegate:self 
                                                                             withUser:self.turnManager.lastCardCzar 
                                                                         withQuestion:self.currentTurnManager.currentQuestion 
                                                                       isCardCzarPick:TRUE];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    }
    if ([self.nextStep isEqualToString:@"showScores"]){
        ScoreViewController *controller = [[ScoreViewController alloc] init];
        controller.delegate = self;
        controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentModalViewController:controller animated:YES];
    }
    if ([self.nextStep isEqualToString:@"restart"]){
        [self gameInit];
    }
}

#pragma mark - Other Views

- (void)dismissModalView:(NSString *)whichView withFlag:(BOOL)flag
{
    // dismiss view
    [self dismissModalViewControllerAnimated:YES];
    // dismiss any prior next steps
    self.nextStep = nil;
    // figure out next step
    if ([whichView isEqualToString:@"splash"]){
        self.nextStep = @"getNames";
    }
    if ([whichView isEqualToString:@"setup"]){
        self.nextStep = @"startRound";
    }
    if ([whichView isEqualToString:@"blackCard"]){
        // begin game
        self.nextStep = @"nextTurn";
    }
    if ([whichView isEqualToString:@"hand"]){
        // check if users left to go
        if ([self.turnManager.usersLeftToGo count] == 0){
            // display choices to card czar
            self.nextStep = @"cardCzarPick";
        }
        else {
            // next turn
            self.nextStep = @"nextTurn";
        }
    }
    if ([whichView isEqualToString:@"czarPick"]){
        self.nextStep = @"showScores";
    }
    if ([whichView isEqualToString:@"scores"]){
        // the flag represents whether another round is to be played
        if (flag){
            self.nextStep = @"startRound";
        }
        else {
            self.nextStep = @"restart";
        }
    }
    // can't do anything until this view disappears and this view loads, so store data in class and wait (until viewDidAppear)
}

@end
