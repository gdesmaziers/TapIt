//
//  GameItem.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameItem.h"
#import "Constants.h"

@implementation GameItem

- (instancetype)initWithGameItemType:(GameItemType)itemType {
    self = [super init];
    if (self) {
        self.itemType = itemType;
        self.position = -GAME_ITEM_SIZE;
    }
    return self;
}

- (void)move {
    self.position += GAME_MOVE_INTERVAL;
}

@end
