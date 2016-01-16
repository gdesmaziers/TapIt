//
//  GameItemView.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameItemView.h"
#import "GameView.h"
#import "CircleGameItemView.h"
#import "HaxagoneGameItemView.h"
#import "Constants.h"

@interface GameItemView()

- (UIBezierPath *)gamePath;

@end

@implementation GameItemView

+ (instancetype)gameItemViewWithGameItem:(GameItem *)item x:(CGFloat)x delegate:(id<GameItemViewDelegate>)delegate {
    switch (item.itemType) {
        case GameItemTypeCircle:
            return [[CircleGameItemView alloc] initWithGameItem:item x:x delegate:delegate];
            break;
        case GameItemTypeHexagone:
            return [[HaxagoneGameItemView alloc] initWithGameItem:item x:x delegate:delegate];
            break;
        default:
            return nil;
    }
    
}

- (instancetype)initWithGameItem:(GameItem *)item x:(CGFloat)x delegate:(id<GameItemViewDelegate>)delegate {
    self = [super initWithFrame:CGRectMake(x, -GAME_ITEM_SIZE, GAME_ITEM_SIZE, GAME_ITEM_SIZE)];
    if (self) {
        self.item = item;
        self.delegate = delegate;
        self.backgroundColor = [UIColor orangeColor];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
        tapRecognizer.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapRecognizer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.frame = self.bounds;
    UIGraphicsBeginImageContext(self.frame.size);
    UIBezierPath *gamePath = [self gamePath];
    [gamePath closePath];
    [gamePath fill];
    maskLayer.path = gamePath.CGPath;
    UIGraphicsEndImageContext();
    self.layer.mask = maskLayer;
}

- (UIBezierPath *)gamePath {
    return [UIBezierPath bezierPath];
}

- (void)updatePosition {
    self.frame = CGRectMake(self.frame.origin.x, self.item.position, GAME_ITEM_SIZE, GAME_ITEM_SIZE);
}

- (void)onTap:(UITapGestureRecognizer *)recognizer {
    [self.delegate gameItemViewWasTapped:self];
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    }completion:^(BOOL finished) {
        [((GameView *)self.superview) removeItemView:self];
    }];
}

@end
