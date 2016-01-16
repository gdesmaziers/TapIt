//
//  GameItem.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameItem : NSObject

@property(nonatomic, assign) float position;

- (void)move;

@end
