//
//  GameItem.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    GameItemTypeCircle,
    GameItemTypeHexagone
} GameItemType;

@interface GameItem : NSObject

@property(nonatomic, assign) GameItemType itemType;
@property(nonatomic, assign) float position;

- (instancetype)initWithGameItemType:(GameItemType)itemType;
- (void)move;

@end
