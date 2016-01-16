//
//  GameViewController.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "GameViewController.h"
#import "GameView.h"
#import "GameItemView.h"

@implementation GameViewController

- (void)awakeFromNib {
    self.game = [[Game alloc] init];
    self.game.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.game start];
    [self updateScoreLabel];
}

- (void)updateScoreLabel {
    [(GameView *)self.view updateScoreLabel:self.game.player.score];
}

- (void)displayScoreAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"Score : %d", self.game.player.score] message:@"Entrez votre nom" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        self.playerNameTextField = textField;
        textField.text = self.game.player.name;
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        if(self.playerNameTextField.text.length>0) {
            self.game.player.name = self.playerNameTextField.text;
            [self.game saveScoreForCurrentPlayer];
        }
        [self dismissViewControllerAnimated:YES completion:^{
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }]];
    [alert.view setNeedsLayout];
    [self presentViewController:alert animated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark GameDelegate
- (float)gameMaxItemPosition:(Game *)game {
    return self.view.frame.size.height;
}

-(void)game:(Game *)game didAddItem:(GameItem *)item inColum:(int)column {
    [(GameView *)self.view addNewItemViewInColum:column withGameItem:item delegate:self];
}

-(void)gameDidMoveItems:(Game *)game {
    for(GameItemView *itemView in ((GameView *)self.view).itemViews) {
        [itemView updatePosition];
    }
}

-(void)game:(Game *)game itemDidDisappeared:(GameItem *)gameItem {
    [(GameView *)self.view removeItemViewForItem:gameItem];
    [(GameView *)self.view updateLifesDisplay:self.game.lifes];
}

-(void)gameDidFinished:(Game *)game {
    [self displayScoreAlert];
}

#pragma mark GameItemViewDelegate
-(void)gameItemViewWasTapped:(GameItemView *)gameItemView {
    [self.game playItem:gameItemView.item];
    [self updateScoreLabel];
}

@end
