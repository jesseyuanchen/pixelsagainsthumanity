//
//  DeckManager.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DeckManager.h"
#import <stdlib.h>

@implementation DeckManager

// these act as a look up service, so cards can be passed by number
@synthesize whiteCards = _whiteCards;
@synthesize blackCards = _blackCards;
// simply hold numeric references to above
@synthesize whiteCardDeck = _whiteCardDeck;
@synthesize blackCardDeck = _blackCardDeck;

- (DeckManager *)init
{
    if (self = [super init]){
        // init both references
        self.whiteCards = [[NSMutableArray alloc] init];
        self.blackCards = [[NSMutableArray alloc] init];
        self.whiteCardDeck = [[NSMutableArray alloc] init];
        self.blackCardDeck = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)makeDeckWithFamilyFriendlyMode:(BOOL)on
{
    // load clean cards into temp arrays
    NSString *cleanWhiteCardPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"clean" ofType:@"plist"];
    NSString *cleanBlackCardPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"cleanQuestions" ofType:@"plist"];
    NSMutableArray *tempCleanWhiteCard = [[NSMutableArray alloc] initWithContentsOfFile:cleanWhiteCardPath];
    NSMutableArray *tempCleanBlackCard = [[NSMutableArray alloc] initWithContentsOfFile:cleanBlackCardPath];
    // add clean cards to dictionary
    [self.whiteCards addObjectsFromArray:tempCleanWhiteCard];
    [self.blackCards addObjectsFromArray:tempCleanBlackCard];
    // do same with dirty cards if family freindly mode is off
    if (!on){
        // load into temp arrays
        NSString *dirtyWhiteCardPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"dirty" ofType:@"plist"];
        NSString *dirtyBlackCardPath = [[NSBundle bundleForClass:[self class]] pathForResource:@"dirtyQuestions" ofType:@"plist"];
        NSMutableArray *tempDirtyWhiteCard = [[NSMutableArray alloc] initWithContentsOfFile:dirtyWhiteCardPath];
        NSMutableArray *tempDirtyBlackCard = [[NSMutableArray alloc] initWithContentsOfFile:dirtyBlackCardPath];
        // add to dictionary
        [self.whiteCards addObjectsFromArray:tempDirtyWhiteCard];
        [self.blackCards addObjectsFromArray:tempDirtyBlackCard]; 
    }
    
    // make both decks (by shuffling cards)
    NSInteger amountOfWhiteCards = [self.whiteCards count];
    for (NSInteger i = 0; i < amountOfWhiteCards; i++){
        NSInteger tempIndex = 0;
        if ([self.whiteCardDeck count] != 0){
            // if not first card, insert card at random point in array
            tempIndex = arc4random() % ([self.whiteCardDeck count] + 1);
        }
        [self.whiteCardDeck insertObject:[NSNumber numberWithInt:i] atIndex:tempIndex];
    }
    NSInteger amountOfBlackCards = [self.blackCards count];
    for (NSInteger i = 0; i < amountOfBlackCards; i++){
        NSInteger tempIndex = 0;
        if ([self.blackCardDeck count] != 0){
            // if not first card, insert card at random point in array
            tempIndex = arc4random() % ([self.blackCardDeck count] + 1);
        }
        [self.blackCardDeck insertObject:[NSNumber numberWithInt:i] atIndex:tempIndex];
    }
}

- (NSInteger)drawCardWhichIsWhite:(BOOL)whiteCard{
    if (whiteCard){
        // check to make sure that deck still has cards left
        if ([self.whiteCardDeck count] != 0){
            // get first card
            NSInteger card = [(NSNumber *)[self.whiteCardDeck objectAtIndex:0] intValue];
            // remove from deck
            [self.whiteCardDeck removeObjectAtIndex:0];
            // return card
            return card;
        }
        else {
            // no cards left so return std error code, can't return nil because that is pointer and I am returning an integer
            return -1;
        }
    }
    else {
        // check to make sure that deck still has cards left
        if ([self.blackCardDeck count] != 0){
            // get first card
            NSInteger card = [(NSNumber *)[self.blackCardDeck objectAtIndex:0] intValue];
            // remove from deck
            [self.blackCardDeck removeObjectAtIndex:0];
            // return card
            return card;
        }
        else {
            // no cards left so return std error code, can't return nil because that is pointer and I am returning an integer
            return -1;
        }
    }
}

@end
