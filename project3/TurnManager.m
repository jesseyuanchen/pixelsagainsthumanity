//
//  TurnManager.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TurnManager.h"

@implementation TurnManager

@synthesize amountOfUsers = _amountOfUsers;
@synthesize lastCardCzar = _lastCardCzar;
@synthesize usersLeftToGo = _usersLeftToGo;

- (TurnManager *)init
{
    if (self = [super init]){
        self.usersLeftToGo = [[NSMutableArray alloc] init];
        self.lastCardCzar = 0;
    }
    return self;
}

- (NSInteger)getNextCardCzarAndStartRound
{
    // calculate next user (wrapping around if all users have already been card czar
    NSInteger nextCzar = ((self.lastCardCzar + 1) % self.amountOfUsers);
    // update the last card czar
    self.lastCardCzar = nextCzar;
    // empty people who still need to go (this shouldn't need to b eemptied, but just in case)
    [self.usersLeftToGo removeAllObjects];
    // add all users as people who still need a turn (because no one has had a turn yet)
    for (NSInteger i = 0; i < self.amountOfUsers; i++){
        [self.usersLeftToGo insertObject:[NSNumber numberWithInt:i] atIndex:i];
    }
    // remove card czar, because he/she doesn't need a turn
    [self.usersLeftToGo removeObjectAtIndex:nextCzar];
    // return calculated value of czar
    return nextCzar;
}

- (NSInteger)getNextUserToGo
{
    // check if another user is left
    if ([self.usersLeftToGo count] != 0){
        NSInteger user = [(NSNumber *)[self.usersLeftToGo objectAtIndex:0] intValue];
        // remove from deck
        [self.usersLeftToGo removeObjectAtIndex:0];
        // return card
        return user;
    }
    else {
        // no users left, so return -1 (which is an error code); I can't return nil because that is pointer and I am returning an integer
        return -1;
    }
}

@end
