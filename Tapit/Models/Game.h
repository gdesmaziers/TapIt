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

-(float)gameMaxItemPosition:(Game *)game;
-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column;
-(void)gameDidMoveItems:(Game *)game;
-(void)game:(Game *)game itemDisappeared:(GameItem *)gameItem;

@end

@interface Game : NSObject

@property(nonatomic, strong) NSMutableArray *items;
@property(nonatomic, assign) int lifes;
@property(nonatomic, assign) int score;
@property(nonatomic, assign) float itemsMoveInterval;
@property(nonatomic, assign) float newItemsInterval;
@property(nonatomic, assign) int chainMultiplier;
@property(nonatomic, weak) id<GameDelegate>delegate;

- (void)start;
- (void)playItem:(GameItem *)item;

@end
