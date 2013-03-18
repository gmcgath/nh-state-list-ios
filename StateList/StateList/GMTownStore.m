//
//  GMTownStore.m
//  StateList
//
//  Created by gmcgath on 3/16/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

/* The class TownStore manages the persistent store for town data. */
#import <CoreData/NSManagedObject.h>
#import <CoreData/NSFetchRequest.h>
#import <CoreData/NSEntityDescription.h>

#import "StateListConstants.h"
#import "GMTownStore.h"
#import "GMAppDelegate.h"

@interface Town : NSManagedObject

/* Town name */
@property (nonatomic) NSString *name;

/* Town population */
@property (nonatomic) NSInteger pop;

/* Geographic location of the town. Latitude is north and longitude west. */
@property (nonatomic) NSInteger latDeg;
@property (nonatomic) NSInteger latMin;
@property (nonatomic) NSInteger latSec;
@property (nonatomic) NSInteger longDeg;
@property (nonatomic) NSInteger longMin;
@property (nonatomic) NSInteger longSec;

@end

@implementation GMTownStore {

    NSPersistentStore *townStore;
    GMAppDelegate *appDelegate;
    NSURL *url;
    NSMutableArray *towns;
    NSEntityDescription *townEntity;
    NSManagedObjectContext *moc;
    Town *curTown;
}

-(id) init:(GMAppDelegate *)appDel {
    appDelegate = appDel;
    //dataFilePath  = @"DataFiles/TownDB";
    url = [[NSBundle mainBundle]
                  URLForResource: dataFilePath withExtension:@"csv"];
    [self checkForUpdates];
    return self;
}

/** createStore is called only if there is no existing store and a fresh one
    is needed. Can the app ship with a default store, or do I need to
    generate it the first time?
 */
- (void) createStore {
    
}

/** Return the town array */
- (NSArray *) getTowns {
    moc = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    townEntity =
          [NSEntityDescription entityForName:@"Town" inManagedObjectContext:moc];
    [request setEntity:townEntity];
    NSPredicate *predicate = [NSPredicate predicateWithValue:true];
    [request setPredicate:predicate];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        
                                        initWithKey:@"town" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    NSError *error;
    
    NSArray *array = [moc executeFetchRequest:request error:&error];
    return array;
}

/** Load the persistent object store
 */
- (void) loadStore {
    NSPersistentStoreCoordinator *psc = [moc persistentStoreCoordinator];
    NSError *error = nil;
    NSDictionary *options =
                [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:1]
                                forKey:NSReadOnlyPersistentStoreOption];
    townStore = [psc addPersistentStoreWithType:NSSQLiteStoreType
                      configuration:nil
                                URL:url
                                options:options
                                error: &error];
    if (townStore == nil) {
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
    curTown = (Town *)[[NSManagedObject alloc]
                 initWithEntity:townEntity
                 insertIntoManagedObjectContext:moc];

}

/** Called after reading a field. */
- (void)parser:(CHCSVParser *)parser didReadField:(NSString *)field
                 atIndex:(NSInteger)fieldIndex {
    TownFieldType tField = (TownFieldType) fieldIndex;
    switch (tField) {
        case TownName:
            [curTown setName:field];
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

@end
