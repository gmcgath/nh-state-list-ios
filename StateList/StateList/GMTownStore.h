//
//  GMTownStore.h
//  StateList
//
//  Created by gmcgath on 3/16/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/NSManagedObjectContext.h>
#import <CoreData/NSPersistentStore.h>
#import <CoreData/NSPersistentStoreCoordinator.h>

#import "CHCSVParser.h"

@interface GMTownStore : NSObject <CHCSVParserDelegate>

@end
