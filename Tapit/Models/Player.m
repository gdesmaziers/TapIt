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

+ (void)getBestPlayers:(void (^)(NSArray *players))successBlock error:(void (^)(NSError *error))errorBlock {
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    query.limit = 15;
    [query orderByDescending:@"score"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSArray *bestPlayers = [NSArray array];
            for (PFObject *object in objects) {
                bestPlayers = [bestPlayers arrayByAddingObject:[[Player alloc] initWithName:object[@"playerName"] score:[object[@"score"] intValue]]];
            }
            if(successBlock!=NULL) {
                successBlock(bestPlayers);
            }
        } else {
            if(errorBlock!=NULL) {
                errorBlock(error);
            }
        }
    }];
}

+(int)bestScore {
    NSNumber *bestScore = [[NSUserDefaults standardUserDefaults] objectForKey:@"bestScore"];
    return bestScore!=nil ? [bestScore intValue] : 0;
}

- (void)saveScore {
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
    gameScore[@"score"] = [NSNumber numberWithInt:self.score];
    gameScore[@"playerName"] = self.name;
    [gameScore saveEventually];
    [[NSUserDefaults standardUserDefaults] setObject:self.name forKey:@"lastPlayerName"];
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:self.score] forKey:@"bestScore"];
}

@end
