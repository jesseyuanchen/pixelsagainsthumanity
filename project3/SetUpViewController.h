//
//  SetUpViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface SetUpViewController : UIViewController <ModalViewController>

@property (weak, nonatomic, readwrite) IBOutlet UILabel *userQuestionLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *continueLabel;

@property (weak, nonatomic) IBOutlet UITextField *userQuestionField;
@property (assign, nonatomic, readwrite) NSInteger usersToGetInputFrom;
@property (assign, nonatomic, readwrite) NSInteger usersGottenInputFrom;

- (IBAction)submitName:(id)sender;
- (void)getNameOfNextUser;
- (void)done;

@end
