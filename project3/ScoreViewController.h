//
//  ScoreViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface ScoreViewController : UIViewController <ModalViewController, UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic, readwrite) IBOutlet UILabel *donePlayingLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *continuePlayingLabel;

- (IBAction)anotherRound;
- (IBAction)newGame;

@end
