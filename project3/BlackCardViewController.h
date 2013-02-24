//
//  BlackCardViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface BlackCardViewController : UIViewController <ModalViewController>

@property (weak, nonatomic, readwrite) IBOutlet UILabel *question; 
@property (weak, nonatomic, readwrite) IBOutlet UILabel *doneLabel;
@property (assign, nonatomic, readwrite) NSInteger card;
@property (assign, nonatomic, readwrite) NSInteger czar;


- (BlackCardViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withCard:(NSInteger)card withCzar:(NSInteger)czar;
- (IBAction)done;

@end
