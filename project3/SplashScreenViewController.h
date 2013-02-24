//
//  SplashScreenViewController.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface SplashScreenViewController : UIViewController <ModalViewController, ModalViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *familyFriendlySwitch;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *playLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *playersLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *familyLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *instructionsLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic, readwrite) IBOutlet UILabel *amazonLabel;

- (IBAction)done:(id)sender;
- (IBAction)updateSliderLabel:(UISlider *)sender;
- (IBAction)showInstructions:(id)sender;
- (IBAction)showAmazon:(id)sender;
- (IBAction)showWebsite:(id)sender;

@end
