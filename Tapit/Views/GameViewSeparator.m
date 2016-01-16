//
//  GameViewSeparator.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameViewSeparator.h"
#import "Constants.h"

@implementation GameViewSeparator

- (instancetype)initWithHeight:(CGFloat)height x:(CGFloat)x;{
    self = [super initWithFrame:CGRectMake(x, 0.0f, GAME_SEPARATOR_SIZE, height)];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}

@end
