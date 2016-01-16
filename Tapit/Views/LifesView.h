//
//  LifesView.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifesView : UIView

@property(nonatomic, strong) NSArray *lifeImageViews;

- (instancetype)initWithOrigin:(CGPoint)origin numberOfLifes:(int)numberOfLifes;
- (void)updateLifesDisplay:(int)numberOfRemainingLifes;

@end
