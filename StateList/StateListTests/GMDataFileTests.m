//
//  GMDataFileTests.m
//  StateList
//
//  Created by gmcgath on 3/18/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMDataFileTests.h"
#import "GMTownStore.h"
#import "GMTown.h"

@implementation GMDataFileTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testParse {
    GMTownStore *townStore = [[GMTownStore alloc] init];
    [townStore loadStore];
    NSArray *towns = [townStore getTowns];
    STAssertNotNil(towns, @"No towns loaded");
    STAssertTrue([towns count] > 0, @"Town array is empty");
    GMTown *town = [towns objectAtIndex:0];
    STAssertTrue([[town name] isEqualToString:@"Acworth"],
                 @"First town name is wrong");
}
@end
