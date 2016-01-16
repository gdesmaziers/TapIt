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

@implementation GameView

- (void)awakeFromNib {
    self.itemViews = [NSArray array];
}

- (void)drawRect:(CGRect)rect {
    for(int i=0;i<(GAME_NUMBER_OF_COLUM-1);i++) {
        [self addSubview:[[GameViewSeparator alloc] initWithHeight:self.frame.size.height x:self.frame.size.width/GAME_NUMBER_OF_COLUM*(i+1)]];
    }
}

- (void)addNewItemViewInColum:(int)column withGameItem:(GameItem *)item delegate:(id<GameItemViewDelegate>)delegate {
    if(column<GAME_NUMBER_OF_COLUM-1) {
        float columnSize = (self.frame.size.width-((GAME_NUMBER_OF_COLUM-1)*GAME_SEPARATOR_SIZE))/GAME_NUMBER_OF_COLUM;
        GameItemView *itemView = [GameItemView gameItemViewWithGameItem:item x:(columnSize+GAME_SEPARATOR_SIZE)*column+(columnSize-GAME_ITEM_SIZE)/2 delegate:delegate];
        self.itemViews = [self.itemViews arrayByAddingObject:itemView];
        [self addSubview:itemView];
    }
}

@end
