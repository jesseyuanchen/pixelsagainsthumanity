//
//  DeckManager.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeckManager : NSObject

@property (strong, nonatomic, readwrite) NSMutableArray *whiteCards;
@property (strong, nonatomic, readwrite) NSMutableArray *blackCards;
@property (strong, nonatomic, readwrite) NSMutableArray *whiteCardDeck;
@property (strong, nonatomic, readwrite) NSMutableArray *blackCardDeck;

- (void)makeDeckWithFamilyFriendlyMode:(BOOL)on;
- (NSInteger)drawCardWhichIsWhite:(BOOL)whiteCard;

@end
