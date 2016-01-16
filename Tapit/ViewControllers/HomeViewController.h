//
//  HomeViewController.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) IBOutlet UITableView *bestPlayersTableView;
@property(nonatomic, strong) IBOutlet UIActivityIndicatorView *bestPlayersActivityIndicatorView;
@property(nonatomic, strong) IBOutlet UILabel *bestScoreLabel;
@property(nonatomic, strong) NSArray *bestPlayers;

@end
