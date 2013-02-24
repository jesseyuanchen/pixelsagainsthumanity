//
//  MainViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ModalViewControllerDelegate.h"
#import "DeckManager.h"
#import "TurnManager.h"
#import "CurrentTurnManager.h"
#import "UserManager.h"

@interface MainViewController : UIViewController <ModalViewControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic, readwrite) DeckManager *deckManager;
@property (strong, nonatomic, readwrite) TurnManager *turnManager;
@property (strong, nonatomic, readwrite) CurrentTurnManager *currentTurnManager;
@property (strong, nonatomic, readwrite) UserManager *userManager;
@property (assign, nonatomic, readwrite) BOOL firstLoad;
@property (strong, nonatomic, readwrite) NSString *nextStep;

- (void)dismissModalView:(NSString *)whichView withFlag:(BOOL)flag;
- (void)emptyDeck;
- (void)gameInit;
- (void)executeNextStep;

@end
