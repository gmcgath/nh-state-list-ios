//
//  GMOptions.m
//  StateList
//
//  Created by gmcgath on 5/19/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMOptions.h"

@implementation GMOptions

@synthesize showNorth;
@synthesize showMiddle;
@synthesize showSouth;
@synthesize minPopulation;

-(id) init {
    [self setShowNorth:true];
    [self setShowMiddle:true];
    [self setShowSouth:true];
    [self setMinPopulation:0];
    return self;
}

@end
