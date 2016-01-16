//
//  UIView+Nib.m
//  Tapit
//
//  Created by Grégory DESMAZIERS on 17/01/2016.
//  Copyright © 2016 Voodoo. All rights reserved.
//

#import "UIView+Nib.h"

@implementation UIView (Nib)

+ (id)viewFromNibWithName:(NSString *)nibName {
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (NSObject *nibItem in nibContents) {
        if ([nibItem class] == [self class]) return nibItem;
    }
    return nil;
}

@end
