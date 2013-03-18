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

#import "GMTownStore.h"
#import "GMAppDelegate.h"

@interface Town : NSManagedObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger *pop;

@end

@implementation GMTownStore {
    
    NSPersistentStore *townStore;
    GMAppDelegate *appDelegate;
    NSURL *url;
    NSMutableArray *towns;
}

-(id) init:(GMAppDelegate *)appDel {
    appDelegate = appDel;
    url = [[NSBundle mainBundle]
                  URLForResource: @"DataFiles/TownDB" withExtension:@"csv"];
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
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =
          [NSEntityDescription entityForName:@"Town" inManagedObjectContext:moc];
    return nil;      // **** STUB
}

/** Load the persistent object store
 */
- (void) loadStore {
    NSManagedObjectContext *moc = [appDelegate managedObjectContext];
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
    

}

@end
