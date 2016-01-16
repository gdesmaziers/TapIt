//
//  GameViewController.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
#import "GameItemView.h"

@interface GameViewController : UIViewController<GameDelegate, GameItemViewDelegate>

@property(nonatomic, strong) Game *game;
@property(nonatomic, strong) UITextField *playerNameTextField;

@end
