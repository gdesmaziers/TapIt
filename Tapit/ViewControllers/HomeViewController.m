//
//  HomeViewController.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "HomeViewController.h"
#import "BestPlayerTableViewCell.h"
#import "UIView+Nib.h"
#import "Player.h"
#import "Parse.h"

@implementation HomeViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.bestPlayersTableView.hidden = self.bestPlayers==nil;
    self.bestPlayersActivityIndicatorView.hidden = self.bestPlayers!=nil;
    [Player getBestPlayers:^(NSArray *players) {
        self.bestPlayers = players;
        self.bestPlayersActivityIndicatorView.hidden = YES;
        self.bestPlayersTableView.hidden = NO;
       [self.bestPlayersTableView reloadData];
    } error:NULL];
    self.bestScoreLabel.text = [NSString stringWithFormat:@"Votre meilleur score : %d", [Player bestScore]];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
    return self.bestPlayers.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BestPlayerTableViewCell *cell = (BestPlayerTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"BestPlayerTableViewCell"];
    if(cell==nil) {
        cell = [BestPlayerTableViewCell viewFromNibWithName:@"BestPlayerTableViewCell"];
    }
    Player *player = [self.bestPlayers objectAtIndex:indexPath.row];
    [cell updateWithPlayer:player];
    return cell;
}

@end
