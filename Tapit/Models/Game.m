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

@end

@implementation Game

- (instancetype)init {
    self = [super init];
    if (self) {
        self.score = 0;
        self.lifes = GAME_NUMBER_OF_INITIAL_LIFES;
        self.itemsMoveInterval = GAME_INITIAL_ITEMS_MOVE_INTERVAL;
        self.newItemsInterval = GAME_INITIAL_NEW_ITEMS_INTERVAL;
        self.isInChainMode = NO;
        self.items = [NSArray array];
    }
    return self;
}

- (void)start {
    [self displayNextItems];
    [self moveItems];
}

- (void)scorePlayer {
    if(!self.isInChainMode) {
        self.score++;
    }
    else {
        self.score = self.score + 2;
    }
    if(self.score%10==0) {
        self.itemsMoveInterval = self.itemsMoveInterval*0.9;
        self.newItemsInterval = self.newItemsInterval*0.9;
    }
}

- (void)enableChainMode {
    if(!self.isInChainMode) {
        self.isInChainMode = YES;
        self.itemsMoveInterval = self.itemsMoveInterval*0.75;
    }
}

- (void)disableChainMode {
    self.isInChainMode = NO;
}

- (void)moveItems {
    for(GameItem *item in self.items) {
        [item move];
    }
    [self.delegate gameDidMoveItems:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  self.itemsMoveInterval* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self moveItems];
    });
}

- (void)displayNextItems {
    //Si le score du joueur est entre 0 et 50, on ajoute 1 ou 2 items
    //Si le score du joueur est entre 50 et 100, on ajoute 1, 2 ou 3 items
    //Si le score du joueur est supérieur ou égal à 100, on ajoute 1, 2, 3 ou 4 items
    int numberOfItemsToDispay = 1 + arc4random_uniform(MIN((int)(self.score/50)+2,4));
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
        if(self.score<25) {
            isHexagone = (0 + arc4random_uniform(5))==0;
        }
        else if(self.score>=25 && self.score<50) {
            isHexagone = (0 + arc4random_uniform(4))==0;
        }
        else if(self.score>=50 && self.score<75) {
            isHexagone = (0 + arc4random_uniform(3))==0;
        }
        else {
            isHexagone = (0 + arc4random_uniform(2))==0;
        }
        GameItem *newItem = [[GameItem alloc] initWithGameItemType:isHexagone ? GameItemTypeHexagone : GameItemTypeCircle];
        self.items = [self.items arrayByAddingObject:newItem];
        int availbaleColumnIndex = arc4random_uniform((int)availbaleColumns.count);
        [self.delegate game:self didAddItem:newItem inColum:[[availbaleColumns objectAtIndex:availbaleColumnIndex] intValue]];
        NSLog(@"column : %d", [[availbaleColumns objectAtIndex:availbaleColumnIndex] intValue]);
        [availbaleColumns removeObjectAtIndex:availbaleColumnIndex];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,  self.newItemsInterval* NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self displayNextItems];
    });
}

@end
