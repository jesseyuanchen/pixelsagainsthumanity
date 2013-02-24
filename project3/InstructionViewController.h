//
//  InstructionViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"


@interface InstructionViewController : UIViewController <ModalViewController>

- (IBAction)done:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *instructionText;

@end
