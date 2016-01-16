//
//  BestPlayerTableViewCell.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 17/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "BestPlayerTableViewCell.h"

@implementation BestPlayerTableViewCell

- (void)updateWithPlayer:(Player *)player {
    self.nameLabel.text = player.name;
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", player.score];
}

@end
