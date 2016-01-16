//
//  BestPlayerTableViewCell.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 17/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface BestPlayerTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *nameLabel;
@property(nonatomic, strong) IBOutlet UILabel *scoreLabel;

- (void)updateWithPlayer:(Player *)player;

@end
