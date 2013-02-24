//
//  ScoreViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ScoreViewController.h"
#import "MainViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

@synthesize delegate = _delegate;
@synthesize continuePlayingLabel = _continuePlayingLabel;
@synthesize donePlayingLabel = _donePlayingLabel;

#pragma mark - buttons

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set labels
    self.continuePlayingLabel.text = NSLocalizedString(@"CONTINUEPLAYING", nil);
    self.donePlayingLabel.text = NSLocalizedString(@"DONEPLAYING", nil);
}

- (IBAction)anotherRound
{
    [self.delegate dismissModalView:@"scores" withFlag:TRUE];
}

- (IBAction)newGame
{
    [self.delegate dismissModalView:@"scores" withFlag:FALSE];
}
    
#pragma mark - table view stuff

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return amount of users
    return ((MainViewController *)self.delegate).userManager.amountOfUsers;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // identifier that allows cell to be pulled from cache
    static NSString *CellIdentifier = @"Cell";
    
    // try to get cell from cache
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // no cell in cache, so allocate a new cell
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // set text of cell
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", [((MainViewController *)self.delegate).userManager.userNames objectAtIndex:indexPath.row], [((MainViewController *)self.delegate).userManager.userScores objectAtIndex:indexPath.row]];
    // give it back
    return cell;
}

@end
