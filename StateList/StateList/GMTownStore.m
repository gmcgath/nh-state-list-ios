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
#import "GMOptions.h"

#define DEGREELIMIT1 43
#define MINUTELIMIT1 5
#define DEGREELIMIT2 44
#define MINUTELIMIT2 5

@implementation GMTownStore {

    GMAppDelegate *appDelegate;
    NSMutableArray *towns;
    GMTown *curTown;
    GMOptions *curOptions;
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
- (void) loadStore:(GMOptions *)opts {
    curOptions = opts;        // feels a little shaky, but have to feed it to the parser
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
    if ([self sanityCheck: curTown]) {
        if ([self optionsCheck:curTown options:curOptions]) {
            [towns addObject:curTown];
        }
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

/* Run a sanity check on a town's data, return true if sane */
- (BOOL) sanityCheck: (GMTown *) town  {
    return (town.name != nil && town.pop >= 0 &&
            town.latDeg > 41 && town.latDeg < 46 &&
            town.longDeg > 69 && town.longDeg < 73);
}

/* Check if the town's data satisfy the options */
- (BOOL) optionsCheck: (GMTown *) town options: (GMOptions *) opts {
    BOOL result = false;
    if (opts.showNorth) {
        if (town.latDeg > DEGREELIMIT2 ||
            (town.latDeg == DEGREELIMIT2 && town.latMin >= MINUTELIMIT2)) {
            result = true;
        }
    }
    if (opts.showMiddle) {
        if ((town.latDeg < DEGREELIMIT2 ||
            (town.latDeg == DEGREELIMIT2 && town.latMin < MINUTELIMIT2)) &&
            (town.latDeg > DEGREELIMIT1 ||
             (town.latDeg == DEGREELIMIT1 && town.latMin >= MINUTELIMIT1))) {
                result = true;
            }
        
    }
    if (opts.showSouth) {
        if ((town.latDeg < DEGREELIMIT1 ||
             (town.latDeg == DEGREELIMIT1 && town.latMin < MINUTELIMIT1))) {
            result = true;
        }
    }
    return result;
}
/** Simple string concatenation is ridiculous in Objective-C */
- (NSString*) concat: (NSString*) str1 withString:(NSString*) str2 {
    NSMutableString *ms = [[NSMutableString alloc] initWithString:str1];
    [ms appendString:str2];
    return ms;
}

@end
