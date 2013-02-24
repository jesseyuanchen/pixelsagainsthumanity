//
//  HandViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface HandViewController : UIViewController <ModalViewController, ModalViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (assign, nonatomic, readwrite) NSInteger user;
@property (assign, nonatomic, readwrite) NSInteger question;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *questionLabel;
@property (assign, nonatomic, readwrite) NSInteger currentlyOpenedCard;
@property (assign, nonatomic, readwrite) BOOL isCardCzarPick;

- (HandViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withUser:(NSInteger)user withQuestion:(NSInteger)question isCardCzarPick:(BOOL)pick;
- (void)done;

@end
