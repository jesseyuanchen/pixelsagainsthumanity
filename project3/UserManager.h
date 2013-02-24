//
//  UserManager.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

@property (assign, nonatomic, readwrite) NSInteger amountOfUsers;
@property (strong, nonatomic, readwrite) NSMutableArray *userNames;
@property (strong, nonatomic, readwrite) NSMutableArray *userHands;
@property (strong, nonatomic, readwrite) NSMutableArray *userScores;

- (void)giveUser:(NSInteger)user theName:(NSString *)name;

@end
