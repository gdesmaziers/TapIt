//
//  Game.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameItem.h"

@class Game;

@protocol GameDelegate

-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column;
-(void)gameDidMoveItems:(Game *)game;

@end

@interface Game : NSObject

@property(nonatomic, strong) NSArray *items;
@property(nonatomic, assign) int lifes;
@property(nonatomic, assign) int score;
@property(nonatomic, assign) float itemsMoveInterval;
@property(nonatomic, assign) float newItemsInterval;
@property(nonatomic, assign) int chainMultiplier;
@property(nonatomic, weak) id<GameDelegate>delegate;

- (void)start;
- (void)scorePlayer;
- (void)increaseChainMode;
- (void)disableChainMode;

@end
