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
-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column {
    [(GameView *)self.view addNewItemViewInColum:column withGameItem:item delegate:self];
}

-(void)gameDidMoveItems:(Game *)game {
    for(GameItemView *itemView in ((GameView *)self.view).itemViews) {
        [itemView updatePosition];
    }
}

#pragma GameItemViewDelegate
-(void)gameItemViewWasTapped:(GameItemView *)gameItemView {
    if(gameItemView.item.itemType==GameItemTypeCircle) {
        [self.game scorePlayer];
    }
    else {
        [self.game increaseChainMode];
    }
    [self updateScoreLabel];
}

@end
