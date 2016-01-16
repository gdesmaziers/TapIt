//
//  GameViewController.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "GameItemView.h"

@implementation GameViewController

- (void)awakeFromNib {
    self.game = [[Game alloc] init];
    self.game.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.game start];
    [self updateScoreLabel];
}

- (void)updateScoreLabel {
    [(GameView *)self.view updateScoreLabel:self.game.score];
}

#pragma GameDelegate
- (float)gameMaxItemPosition:(Game *)game {
    return self.view.frame.size.height;
}

-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column {
    [(GameView *)self.view addNewItemViewInColum:column withGameItem:item delegate:self];
}

-(void)gameDidMoveItems:(Game *)game {
    for(GameItemView *itemView in ((GameView *)self.view).itemViews) {
        [itemView updatePosition];
    }
}

-(void)game:(Game *)game itemDisappeared:(GameItem *)gameItem {
    [(GameView *)self.view removeItemViewForItem:gameItem];
    [(GameView *)self.view updateLifesDisplay:self.game.lifes];
}

#pragma GameItemViewDelegate
-(void)gameItemViewWasTapped:(GameItemView *)gameItemView {
    [self.game playItem:gameItemView.item];
    [self updateScoreLabel];
}

@end
