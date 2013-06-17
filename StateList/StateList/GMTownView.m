//
//  GMTownView.m
//  StateList
//
//  Created by Gary McGath on 3/19/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
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
    NSInteger height = [self bounds].size.height;
    UIFont *bigFont;
    UIFont *littleFont;
    NSInteger bigLineHeight;
    NSInteger littleLineHeight;
    if (height < 330) {
        bigFont = [UIFont systemFontOfSize:30.0];
        littleFont = [UIFont systemFontOfSize:20.0];
        bigLineHeight = 38;
        littleLineHeight = 25;
    } else {
        bigFont = [UIFont systemFontOfSize:36.0];
        littleFont = [UIFont systemFontOfSize:24.0];
        bigLineHeight = 42;
        littleLineHeight = 28;
    }
    NSInteger yPos = 20;
    CGRect textRect = CGRectMake(0, yPos, CGRectGetWidth(rect), yPos + bigLineHeight);
    UIFont *townFont = bigFont;
    if ([townName length] > 15) {
        townFont = littleFont;
    }
    [townName drawInRect: textRect withFont: townFont
           lineBreakMode: NSLineBreakByWordWrapping
           alignment: NSTextAlignmentCenter];

    yPos += bigLineHeight;
    textRect = CGRectMake(0, yPos, CGRectGetWidth(rect), yPos + littleLineHeight);
    [county drawInRect:textRect withFont:littleFont
            lineBreakMode: NSLineBreakByTruncatingMiddle
            alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, littleLineHeight);
    [population drawInRect:textRect withFont:littleFont
             lineBreakMode: NSLineBreakByTruncatingMiddle
                 alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, littleLineHeight);
    [longitude drawInRect:textRect withFont:littleFont
             lineBreakMode: NSLineBreakByTruncatingMiddle
                 alignment: NSTextAlignmentCenter];

    textRect = CGRectOffset(textRect, 0, littleLineHeight);
    [latitude drawInRect:textRect withFont:littleFont
            lineBreakMode: NSLineBreakByTruncatingMiddle
                alignment: NSTextAlignmentCenter];
}
@end
