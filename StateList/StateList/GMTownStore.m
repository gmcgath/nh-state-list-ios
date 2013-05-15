//
//  GMTownStore.m
//  StateList
//
//  Created by gmcgath on 3/16/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//



#import "StateListConstants.h"
#import "GMTownStore.h"
#import "GMAppDelegate.h"
#import "GMTown.h"

@implementation GMTownStore {

    GMAppDelegate *appDelegate;
    NSMutableArray *towns;
    GMTown *curTown;
}

-(id) init:(GMAppDelegate *)appDel {
    appDelegate = appDel;
    [self checkForUpdates];
    return self;
}

/** createStore is called only if there is no existing store and a fresh one
    is needed. The app ships with a default store, so this may not be needed.
 */
- (void) createStore {
    
}

/** Return the town array */
- (NSArray *) getTowns {
    return towns;
}

/** Load the persistent object store
 */
- (void) loadStore {
    // Getting the bundle this way seems safer than MainBundle
    NSBundle *bundle = [NSBundle bundleForClass: [self class]];
    NSString *fullFilePath = [bundle pathForResource:dataFilePath ofType:@"csv"];
    CHCSVParser *parser = [[CHCSVParser alloc] initWithContentsOfCSVFile:fullFilePath];
    [parser setDelegate:self];
    [parser parse];
    if (towns == nil) {
        [self createStore];
    }
}

/** checkForUpdates is called to determine if an update is available.
 */
- (BOOL) checkForUpdates {
    return FALSE;   // STUB
}

/** ******* CHCSVParserDelegate methods ******** */

/** At the start of the parsing, initialize the towns array */
- (void)parserDidBeginDocument:(CHCSVParser *)parser {
    towns = [[NSMutableArray alloc] init];
}

/** Start of a new line. Create a new Town object */
- (void)parser:(CHCSVParser *)parser didBeginLine:(NSUInteger)recordNumber {
    curTown = [[GMTown alloc] init];
}

/** End of a line. Validate and add the Town object */
- (void)parser:(CHCSVParser *)parser didEndLine:(NSUInteger)recordNumber {
    if (curTown.name != nil && curTown.pop >= 0 &&
        curTown.latDeg > 41 && curTown.latDeg < 46 &&
        curTown.longDeg > 69 && curTown.longDeg < 73) {
        [towns addObject:curTown];
    }
    else if (curTown.pop == 0 && curTown.latDeg == 0 && curTown.longDeg == 0) {
        // Probably a blank line
    }
    else {
        NSLog([self concat:@"Bad town data: " withString:curTown.name],"%@");
        
    }
}


/** Called after reading a field. */
- (void)parser:(CHCSVParser *)parser didReadField:(NSString *)field
                 atIndex:(NSInteger)fieldIndex {
    TownFieldType tField = (TownFieldType) fieldIndex;
    switch (tField) {
        case TownName:
            [curTown setName:field];
            break;
        case TownCounty:
            [curTown setCounty:field];
            break;
        case TownPopulation:
            [curTown setPop:[field integerValue]];
            break;
        case TownLatitudeDeg:
            [curTown setLatDeg:[field integerValue]];
            break;
        case TownLatitudeMin:
            [curTown setLatMin:[field integerValue]];
            break;
        case TownLatitudeSec:
            [curTown setLatSec:[field integerValue]];
            break;
        case TownLongitudeDeg:
            [curTown setLongDeg:[field integerValue]];
            break;
        case TownLongitudeMin:
            [curTown setLongMin:[field integerValue]];
            break;
        case TownLongitudeSec:
            [curTown setLongSec:[field integerValue]];
            break;
        default:
            break;
    }
}

/** Simple string concatenation is ridiculous in Objective-C */
- (NSString*) concat: (NSString*) str1 withString:(NSString*) str2 {
    NSMutableString *ms = [[NSMutableString alloc] initWithString:str1];
    [ms appendString:str2];
    return ms;
}

@end
