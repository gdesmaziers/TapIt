//
//  GameView.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameView.h"
#import "GameViewSeparator.h"
#import "Constants.h"

@interface GameView()

- (GameItemView *)itemViewForItem:(GameItem *)item;

@end

@implementation GameView

- (void)awakeFromNib {
    self.itemViews = [NSMutableArray array];
}

- (void)drawRect:(CGRect)rect {
    for(int i=0;i<(GAME_NUMBER_OF_COLUM-1);i++) {
        [self insertSubview:[[GameViewSeparator alloc] initWithHeight:self.frame.size.height x:self.frame.size.width/GAME_NUMBER_OF_COLUM*(i+1)] belowSubview:self.scoreLabel];
    }
}

- (void)addNewItemViewInColum:(int)column withGameItem:(GameItem *)item delegate:(id<GameItemViewDelegate>)delegate {
    if(column<GAME_NUMBER_OF_COLUM) {
        float columnSize = (self.frame.size.width-((GAME_NUMBER_OF_COLUM-1)*GAME_SEPARATOR_SIZE))/GAME_NUMBER_OF_COLUM;
        GameItemView *itemView = [GameItemView gameItemViewWithGameItem:item x:(columnSize+GAME_SEPARATOR_SIZE)*column+(columnSize-GAME_ITEM_SIZE)/2 delegate:delegate];
        [self insertSubview:itemView belowSubview:self.scoreLabel];
        [self.itemViews addObject:itemView];
    }
}

- (void)updateScoreLabel:(int)score {
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
}

- (void)removeItemView:(GameItemView *)itemView {
    [self.itemViews removeObject:itemView];
    [itemView removeFromSuperview];
}

- (GameItemView *)itemViewForItem:(GameItem *)item {
    for(GameItemView *itemView in self.itemViews) {
        if(itemView.item == item) {
            return itemView;
        }
    }
    return nil;
}

- (void)removeItemViewForItem:(GameItem *)item {
    GameItemView *itemView = [self itemViewForItem:item];
    [itemView removeFromSuperview];
    [self.itemViews removeObject:itemView];
}

@end
