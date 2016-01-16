//
//  Player.h
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property(nonatomic, assign) int score;
@property(nonatomic, strong) NSString *name;

- (instancetype)initWithName:(NSString *)name score:(int)score;
+ (void)getBestPlayers:(void (^)(NSArray *players))success error:(void (^)(NSError *error))error;
+ (int)bestScore;
- (void)saveScore;

@end
