//
//  HaxagoneGameItemView.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "HaxagoneGameItemView.h"

@implementation HaxagoneGameItemView

- (UIBezierPath *)gamePath {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.frame.size.width/2, 0)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height / 4)];
    [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height * 3 / 4)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height * 3 / 4)];
    [path addLineToPoint:CGPointMake(0, self.frame.size.height / 4)];
    return path;
}

@end
