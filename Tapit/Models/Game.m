//
//  Game.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "Game.h"
#import "Constants.h"

@interface Game()

- (void)moveItems;
- (void)displayNextItems;
- (void)scorePlayer;
- (void)increaseChainMode;
- (void)disableChainMode;
- (void)decreaseLife;

@end

@implementation Game

- (instancetype)init {
    self = [super init];
    if (self) {
        self.player = [[Player alloc] init];
        self.lifes = GAME_NUMBER_OF_INITIAL_LIFES;
        self.itemsMoveInterval = GAME_INITIAL_ITEMS_MOVE_INTERVAL;
        self.newItemsInterval = GAME_INITIAL_NEW_ITEMS_INTERVAL;
        self.chainMultiplier = 1;
        self.items = [NSMutableArray array];
    }
    return self;
}

- (void)start {
    [self displayNextItems];
    [self moveItems];
}

- (void)playItem:(GameItem *)item {
    if(item.itemType==GameItemTypeCircle) {
        [self scorePlayer];
    }
    else {
        [self increaseChainMode];
    }
    [self.items removeObject:item];
}

- (void)scorePlayer {
    self.player.score = self.player.score + self.chainMultiplier;
    if(self.player.score%10==0) {
        self.itemsMoveInterval = self.itemsMoveInterval*0.9;
        self.newItemsInterval = self.newItemsInterval*0.9;
    }
}

- (void)increaseChainMode {
    self.chainMultiplier = self.chainMultiplier*2;
    self.itemsMoveInterval = self.itemsMoveInterval*0.75;
}

- (void)disableChainMode {
    self.chainMultiplier = 1;
}

- (void)decreaseLife {
    self.lifes--;
}

- (void)moveItems {
    for(GameItem *item in self.items) {
        [item move];
    }
    [self.delegate gameDidMoveItems:self];
    NSMutableArray *disapearedItems = [NSMutableArray array];
    for(GameItem *item in self.items) {
        if(item.position>[self.delegate gameMaxItemPosition:self]) {
            [self disableChainMode];
            if(item.itemType==GameItemTypeCircle) {
                [self decreaseLife];
            }
            [self.delegate game:self itemDidDisappeared:item];
            [disapearedItems addObject:item];
        }
    }
    [self.items removeObjectsInArray:disapearedItems];
    if(self.lifes<0) {
        [self.delegate gameDidFinished:self];
    }
    else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  self.itemsMoveInterval* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self moveItems];
        });
    }
}

- (void)displayNextItems {
    if(self.lifes>0) {
        //Si le score du joueur est entre 0 et 50, on ajoute 1 ou 2 items
        //Si le score du joueur est entre 50 et 100, on ajoute 1, 2 ou 3 items
        //Si le score du joueur est supérieur ou égal à 100, on ajoute 1, 2, 3 ou 4 items
        int numberOfItemsToDispay = 1 + arc4random_uniform(MIN((int)(self.player.score/50)+2,4));
        NSMutableArray *availbaleColumns = [NSMutableArray arrayWithCapacity:GAME_NUMBER_OF_COLUM];
        for(int i=0;i<GAME_NUMBER_OF_COLUM;i++) {
            [availbaleColumns addObject:[NSNumber numberWithInt:i]];
        }
        for(int i=0;i<numberOfItemsToDispay;i++) {
            //Si le score du joueur est entre 0 et 25, il y a une chance sur 6 d'avoir un hexagone
            //Si le score du joueur est entre 25 et 50, il y a une chance sur 5 d'avoir un hexagone
            //Si le score du joueur est entre 50 et 75, il y a une chance sur 4 d'avoir un hexagone
            //Si le score du joueur est supérieur ou égal à 75, il y a une chance sur 3 d'avoir un hexagone
            BOOL isHexagone = NO;
            if(self.player.score<25) {
                isHexagone = (0 + arc4random_uniform(5))==0;
            }
            else if(self.player.score>=25 && self.player.score<50) {
                isHexagone = (0 + arc4random_uniform(4))==0;
            }
            else if(self.player.score>=50 && self.player.score<75) {
                isHexagone = (0 + arc4random_uniform(3))==0;
            }
            else {
                isHexagone = (0 + arc4random_uniform(2))==0;
            }
            GameItem *newItem = [[GameItem alloc] initWithGameItemType:isHexagone ? GameItemTypeHexagone : GameItemTypeCircle];
            [self.items addObject:newItem];
            int availbaleColumnIndex = arc4random_uniform((int)availbaleColumns.count);
            [self.delegate game:self didAddItem:newItem inColum:[[availbaleColumns objectAtIndex:availbaleColumnIndex] intValue]];
            [availbaleColumns removeObjectAtIndex:availbaleColumnIndex];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  self.newItemsInterval* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self displayNextItems];
        });
    }
}

- (void)saveScoreForCurrentPlayer {
    [self.player saveScore];
}

@end
