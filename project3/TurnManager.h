//
//  TurnManager.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TurnManager : NSObject

@property (assign, nonatomic, readwrite) NSInteger amountOfUsers;
@property (strong, nonatomic, readwrite) NSMutableArray *usersLeftToGo;
@property (assign, nonatomic, readwrite) NSInteger lastCardCzar;

- (NSInteger)getNextCardCzarAndStartRound;
- (NSInteger)getNextUserToGo;

@end
