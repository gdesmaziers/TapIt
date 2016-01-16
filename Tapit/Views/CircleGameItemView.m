//
//  CircleGameItemView.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "CircleGameItemView.h"

@implementation CircleGameItemView

- (UIBezierPath *)gamePath {
    return [UIBezierPath bezierPathWithOvalInRect:self.bounds];
}

@end
