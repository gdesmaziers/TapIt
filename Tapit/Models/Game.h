//
//  Game.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameItem.h"
#import "Player.h"

@class Game;

@protocol GameDelegate

-(float)gameMaxItemPosition:(Game *)game;
-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column;
-(void)gameDidMoveItems:(Game *)game;
-(void)game:(Game *)game itemDidDisappeared:(GameItem *)gameItem;
-(void)gameDidFinished:(Game *)game;

@end

@interface Game : NSObject

@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, assign) int lifes;
@property(nonatomic, strong) Player *player;
@property(nonatomic, assign) float itemsMoveInterval;
@property(nonatomic, assign) float newItemsInterval;
@property(nonatomic, assign) int chainMultiplier;
@property(nonatomic, weak) id<GameDelegate>delegate;

- (void)start;
- (void)playItem:(GameItem *)item;
- (void)saveScoreForCurrentPlayer;

@end
