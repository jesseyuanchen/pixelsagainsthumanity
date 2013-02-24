//
//  CurrentTurnManager.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentTurnManager : NSObject

@property (assign, nonatomic, readwrite) NSInteger currentQuestion;
@property (strong, nonatomic, readwrite) NSMutableDictionary *cardsPlayed;

@end
