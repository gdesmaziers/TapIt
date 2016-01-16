//
//  LifesView.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "LifesView.h"

@implementation LifesView

- (instancetype)initWithOrigin:(CGPoint)origin numberOfLifes:(int)numberOfLifes {
    self = [super initWithFrame:CGRectMake(origin.x, origin.y, numberOfLifes*35.0f, 30.0f)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.lifeImageViews = [NSArray array];
        for(int i=0;i<numberOfLifes;i++) {
            UIImageView *lifeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(i*35.0f, 0.0f, 30.0f, 30.0f)];
            self.lifeImageViews = [self.lifeImageViews arrayByAddingObject:lifeImageView];
            [self addSubview:lifeImageView];
        }
    }
    return self;
}

- (void)updateLifesDisplay:(int)numberOfRemainingLifes {
    for(int i=0;i<self.lifeImageViews.count;i++) {
        UIImage *lifeImage = [UIImage imageNamed:i<numberOfRemainingLifes ? @"IconLife-s" : @"IconLife"];
        [(UIImageView *)[self.lifeImageViews objectAtIndex:i] setImage:lifeImage];
    }
}

@end
