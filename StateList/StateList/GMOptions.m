//
//  GMOptions.m
//  StateList
//
//  Created by Gary McGath on 5/19/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import "GMOptions.h"

@implementation GMOptions

@dynamic showNorth;
@dynamic showMiddle;
@dynamic showSouth;
@synthesize minPopulation;

BOOL bShowNorth;
BOOL bShowSouth;
BOOL bShowMiddle;

NSUserDefaults* defaults;

-(id) init {
    
    [self initDefaults];
    [self setShowNorth:[defaults boolForKey:@"showNorth"]];
    [self setShowMiddle:[defaults boolForKey:@"showSouth"]];
    [self setShowSouth:[defaults boolForKey:@"showMiddle"]];
    [self setMinPopulation:[defaults integerForKey:@"minPopulation"]];
    return self;
}


- (void) initDefaults {
    defaults = [NSUserDefaults standardUserDefaults];
    /* Set default defaults if keys aren't found */
    if ([defaults objectForKey:@"showNorth"] == nil)
        [defaults setBool:TRUE forKey:@"showNorth"];
    if ([defaults objectForKey:@"showSouth"] == nil)
        [defaults setBool:TRUE forKey:@"showSouth"];
    if ([defaults objectForKey:@"showMiddle"] == nil)
        [defaults setBool:TRUE forKey:@"showMiddle"];
    if ([defaults objectForKey:@"minPopulation"] == nil)
        [defaults setInteger:TRUE forKey:@"minPopulation"];

}

- (BOOL) showNorth {
    return bShowNorth;
}

- (void) setShowNorth:(BOOL)showNorth {
    bShowNorth = showNorth;
    [defaults setBool:showNorth forKey:@"showNorth"];
}

- (BOOL) showSouth {
    return bShowSouth;
}

- (void) setShowSouth:(BOOL)showSouth {
    bShowSouth = showSouth;
    [defaults setBool:showSouth forKey:@"showSouth"];
}

- (BOOL) showMiddle {
    return bShowMiddle;
}

- (void) setShowMiddle:(BOOL)showMiddle {
    bShowMiddle = showMiddle;
    [defaults setBool:showMiddle forKey:@"showMiddle"];
}

@end
