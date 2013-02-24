//
//  ModalViewControllerDelegate.h
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModalViewControllerDelegate <NSObject>

- (void)dismissModalView:(NSString *)whichView withFlag:(BOOL)flag;

@end

@protocol ModalViewController <NSObject>

@property (weak, nonatomic) id <ModalViewControllerDelegate> delegate;

@end
