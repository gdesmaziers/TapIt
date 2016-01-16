//
//  Game.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "Game.h"
#import "GameItem.h"
#import "Constants.h"

@interface Game()

- (void)moveItems;
- (void)displayNextItems;

@end

@implementation Game

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lifes = GAME_NUMBER_OF_INITIAL_LIFES;
        self.itemsMoveInterval = GAME_INITIAL_ITEMS_MOVE_INTERVAL;
        self.newItemsInterval = GAME_INITIAL_NEW_ITEMS_INTERVAL;
        self.items = [NSArray array];
    }
    return self;
}

- (void)start {
    [self moveItems];
}

- (void)moveItems {
    for(GameItem *item in self.items) {
        [item move];
    }
    [self.delegate gameDidMoveItems:self];
}

- (void)displayNextItems {
    
}

@end
