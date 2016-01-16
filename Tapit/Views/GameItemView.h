//
//  GameItemView.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameItem.h"

@class GameItemView;

@protocol GameItemViewDelegate

-(void)gameItemViewWasTapped:(GameItemView *)gameItemView;

@end

@interface GameItemView : UIView

@property(nonatomic, strong) GameItem *item;
@property(nonatomic, weak) id<GameItemViewDelegate>delegate;

+ (instancetype)gameItemViewWithGameItem:(GameItem *)item x:(CGFloat)x delegate:(id<GameItemViewDelegate>)delegate;
- (instancetype)initWithGameItem:(GameItem *)item x:(CGFloat)x delegate:(id<GameItemViewDelegate>)delegate;
- (void)updatePosition;

@end
