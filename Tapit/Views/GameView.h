//
//  GameView.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameItem.h"
#import "GameItemView.h"
#import "LifesView.h"

@interface GameView : UIView

@property(nonatomic, strong) IBOutlet UILabel *scoreLabel;
@property(nonatomic, strong) LifesView *lifesView;
@property(nonatomic, strong) NSMutableArray *itemViews;

- (void)removeItemView:(GameItemView *)itemView;
- (void)removeItemViewForItem:(GameItem *)item;
- (void)addNewItemViewInColum:(int)column withGameItem:(GameItem *)item delegate:(id<GameItemViewDelegate>)delegate;
- (void)updateScoreLabel:(int)score;
- (void)updateLifesDisplay:(int)numberOfRemainingLifes;

@end
