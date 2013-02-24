//
//  UserManager.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

@synthesize amountOfUsers = _amountOfUsers;
@synthesize userNames = _userNames;
@synthesize userHands = _userHands;
@synthesize userScores = _userScores;

- (UserManager *)init{
    if (self = [super init]){
        self.userNames = [[NSMutableArray alloc] init];
        self.userHands = [[NSMutableArray alloc] init];
        self.userScores = [[NSMutableArray alloc] init];
        
    }
    return self;
}

- (void)giveUser:(NSInteger)user theName:(NSString *)name
{
    // add name
    [self.userNames insertObject:name atIndex:user];
    // also take this opportunity to intialize hand (array of cards the user is in possention of)
    [self.userHands insertObject:[[NSMutableArray alloc] init] atIndex:user];
    // ... and set the users score to 0
    [self.userScores insertObject:[NSNumber numberWithInt:0] atIndex:user];
}

@end
