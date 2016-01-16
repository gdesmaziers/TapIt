//
//  GameItemTests.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameItem.h"
#import "Constants.h"

@interface GameItemTests : XCTestCase

@property(nonatomic, strong) GameItem *gameItem;

@end

@implementation GameItemTests

- (void)setUp {
    [super setUp];
    self.gameItem = [[GameItem alloc] init];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testMove {
    [self.gameItem move];
    XCTAssertEqual(self.gameItem.position, -GAME_ITEM_SIZE+GAME_MOVE_INTERVAL);
}

@end
