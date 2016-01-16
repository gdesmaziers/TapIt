//
//  Player.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "Player.h"
#import <Parse.h>

@implementation Player

- (instancetype)init {
    self = [super init];
    if (self) {
        self.score = 0;
        self.name = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastPlayerName"];
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name score:(int)score {
    self = [super init];
    if (self) {
        self.score = score;
        self.name = name;
    }
    return self;
}

- (void)saveScore {
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
    gameScore[@"score"] = [NSNumber numberWithInt:self.score];
    gameScore[@"playerName"] = self.name;
    [gameScore saveEventually];
    [[NSUserDefaults standardUserDefaults] setObject:self.name forKey:@"lastPlayerName"];
}

@end
