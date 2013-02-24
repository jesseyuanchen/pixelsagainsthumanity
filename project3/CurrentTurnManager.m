//
//  CurrentTurnManager.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CurrentTurnManager.h"

@implementation CurrentTurnManager

@synthesize cardsPlayed = _cardsPlayed;
@synthesize currentQuestion = _currentQuestion;

 - (CurrentTurnManager *)init
{
    if (self = [super init]){
        self.cardsPlayed = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end
