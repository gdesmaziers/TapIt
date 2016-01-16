//
//  ViewController.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 16/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"

@interface ViewController ()

@end

@implementation ViewController

/*
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
    // NSLog(@"parameter1: %d parameter2: %f", parameter1, parameter2);
});
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    Game *game = [[Game alloc] init];
    
    [NSTimer scheduledTimerWithTimeInterval:0.25f
                                     target:self
                                   selector:@selector(testTime)
                                   userInfo:nil
                                    repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)testTime {
    self.test.frame = CGRectMake(self.test.frame.origin.x, self.test.frame.origin.y+10.0f, self.test.frame.size.width, self.test.frame.size.height);
    NSLog(@"Test");
}

@end
