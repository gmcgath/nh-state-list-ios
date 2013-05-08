//
//  GMTownView.m
//  StateList
//
//  Created by gmcgath on 3/19/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMTownView.h"
#import "GMTownViewController.h"

@implementation GMTownView

@synthesize townName;
@synthesize county;
@synthesize population;
@synthesize longitude;
@synthesize latitude;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void) drawRect:(CGRect)rect {
    UIFont *bigFont = [UIFont systemFontOfSize:36.0];
    UIFont *littleFont = [UIFont systemFontOfSize:24.0];
    CGRect textRect = CGRectMake(0, 20, CGRectGetWidth(rect), 40);
    [townName drawInRect: textRect withFont: bigFont
           lineBreakMode: NSLineBreakByTruncatingMiddle
           alignment: NSTextAlignmentCenter];
    
    textRect = CGRectOffset(textRect, 0, 48);
    [county drawInRect:textRect withFont:littleFont
            lineBreakMode: NSLineBreakByTruncatingMiddle
            alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, 28);
    [population drawInRect:textRect withFont:littleFont
             lineBreakMode: NSLineBreakByTruncatingMiddle
                 alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, 28);
    [longitude drawInRect:textRect withFont:littleFont
             lineBreakMode: NSLineBreakByTruncatingMiddle
                 alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, 28);
    [latitude drawInRect:textRect withFont:littleFont
            lineBreakMode: NSLineBreakByTruncatingMiddle
                alignment: NSTextAlignmentCenter];
}
@end
