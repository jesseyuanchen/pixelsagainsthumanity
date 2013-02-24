//
//  HandViewController.m
//  project3
//
//  Created by Tomas Reimers on 4/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HandViewController.h"
#import "MainViewController.h"
#import "WhiteCardViewController.h"

@interface HandViewController ()

@end

@implementation HandViewController

@synthesize delegate = _delegate;
@synthesize user = _user;
@synthesize question = _question;
@synthesize questionLabel = _questionLabel;
@synthesize currentlyOpenedCard = _currentlyOpenedCard;
@synthesize isCardCzarPick = _isCardCzarPick;


- (HandViewController *)initWithDelegate:(id <ModalViewControllerDelegate>)delegate withUser:(NSInteger)user withQuestion:(NSInteger)question isCardCzarPick:(BOOL)pick
{
    if (self = [super init]){
        self.delegate = delegate;
        self.isCardCzarPick = pick;
        // persist data until I can use it (i.e. view did load)
        self.user = user;
        self.question = question;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // set up question
    self.questionLabel.text = [((MainViewController *)self.delegate).deckManager.blackCards objectAtIndex:self.question];
    // alert users which one of their turns it is
    if (self.isCardCzarPick){
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"CHOOSINGTIME", nil)
                                                          message:[NSString stringWithFormat:NSLocalizedString(@"PASSTOCZAR", nil), [((MainViewController *)self.delegate).userManager.userNames objectAtIndex:self.user]]
                                                         delegate:nil
                                                cancelButtonTitle:NSLocalizedString(@"CANCELBUTTON", nil)
                                                otherButtonTitles:nil];
        [message show];
    }
    else {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"NEXTUSER", nil)
                                                          message:[NSString stringWithFormat:NSLocalizedString(@"NEXTTURN", nil), [((MainViewController *)self.delegate).userManager.userNames objectAtIndex:self.user]]
                                                         delegate:nil
                                                cancelButtonTitle:NSLocalizedString(@"CANCELBUTTON", nil)
                                                otherButtonTitles:nil];
        [message show];
    }
}

- (void)done
{
    // return; flag is irrelevant, so leave it as false (can't use nil because flag is a bool and nil is a pointer)
    if (self.isCardCzarPick){
        [self.delegate dismissModalView:@"czarPick" withFlag:FALSE];
    }
    else {
        [self.delegate dismissModalView:@"hand" withFlag:FALSE];
    }
}

#pragma mark - Table View Data

// no need to provide amount of sections because default is one

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isCardCzarPick){
        return [((MainViewController *)self.delegate).currentTurnManager.cardsPlayed count];
    }
    else {
        return [[((MainViewController *)self.delegate).userManager.userHands objectAtIndex:self.user] count];
    }
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
    if (self.isCardCzarPick){
        NSArray *allUsers = [((MainViewController *)self.delegate).currentTurnManager.cardsPlayed allKeys];
        NSInteger card = [[((MainViewController *)self.delegate).currentTurnManager.cardsPlayed objectForKey:[allUsers objectAtIndex:indexPath.row]] intValue];
        NSString *cardText = [((MainViewController *)self.delegate).deckManager.whiteCards objectAtIndex:card];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", cardText];
    }
    else {
        NSMutableArray *hand = [((MainViewController *)self.delegate).userManager.userHands objectAtIndex:self.user];
        NSInteger card = [[hand objectAtIndex:indexPath.row] intValue];
        NSString *cardText = [((MainViewController *)self.delegate).deckManager.whiteCards objectAtIndex:card];
        cell.textLabel.text = [NSString stringWithFormat:@"%@", cardText];
    }
    // accessory type
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    // display cell
    return cell;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    // get card info
    NSString *cardText;
    if (self.isCardCzarPick){
        NSArray *allUsers = [((MainViewController *)self.delegate).currentTurnManager.cardsPlayed allKeys];
        // set which user we picked last (if this is actually the cardczar view, than this variable serves to show which USER was last opened)
        self.currentlyOpenedCard = [[allUsers objectAtIndex:indexPath.row] intValue];
        // set card text
        NSInteger card = [[((MainViewController *)self.delegate).currentTurnManager.cardsPlayed objectForKey:[allUsers objectAtIndex:indexPath.row]] intValue];
        cardText = [((MainViewController *)self.delegate).deckManager.whiteCards objectAtIndex:card];
    }
    else {
        NSMutableArray *hand = [((MainViewController *)self.delegate).userManager.userHands objectAtIndex:self.user];
        NSInteger card = [[hand objectAtIndex:indexPath.row] intValue];
        // set card text
        cardText = [((MainViewController *)self.delegate).deckManager.whiteCards objectAtIndex:card];
        // establish which card was called
        self.currentlyOpenedCard = card; 
    }
    // load that card
    WhiteCardViewController *controller = [[WhiteCardViewController alloc] initWithDelegate:self withCardText:cardText];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentModalViewController:controller animated:YES];
}

- (void)dismissModalView:(NSString *)whichView withFlag:(BOOL)flag
{    
    // if user picked the card (flag will be true), then return
    if (flag){
        // dismiss card view
        [self dismissModalViewControllerAnimated:NO];
        if (self.isCardCzarPick){
            // give user an awesome point
            // find old score (rememer currently opened card is actually the last user played)
            NSInteger oldScore = [[((MainViewController *)self.delegate).userManager.userScores objectAtIndex:self.currentlyOpenedCard] intValue];
            [((MainViewController *)self.delegate).userManager.userScores replaceObjectAtIndex:self.currentlyOpenedCard withObject:[NSNumber numberWithInt:(oldScore + 1)]];
        }
        else {
            // play the card
            [((MainViewController *)self.delegate).currentTurnManager.cardsPlayed setObject:[NSNumber numberWithInt:self.currentlyOpenedCard] forKey:[NSNumber numberWithInt:self.user]];
            // remove it from that user's hand
            [[((MainViewController *)self.delegate).userManager.userHands objectAtIndex:self.user] removeObject:[NSNumber numberWithInt:self.currentlyOpenedCard]];
        }
        // give next user a turn / show highscores (depending on if this is acting as the card czar pick or as a hand)
        [self done];
    }
    else {
        // dismiss card view, with animation
        [self dismissModalViewControllerAnimated:YES];
    }
}
@end
