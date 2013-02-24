//
//  CardViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface WhiteCardViewController : UIViewController <ModalViewController>

@property (weak, nonatomic, readwrite) IBOutlet UILabel *answer; 
@property (weak, nonatomic, readwrite) IBOutlet UILabel *backLabel; 
@property (weak, nonatomic, readwrite) IBOutlet UILabel *pickLabel; 
@property (strong, nonatomic, readwrite) NSString *card;

- (WhiteCardViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withCardText:(NSString *)card;
- (IBAction)back:(id)sender;
- (IBAction)select:(id)sender;
- (void)doneAndUserDidPick:(BOOL)userPicked;

@end
