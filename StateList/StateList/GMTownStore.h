//
//  GMTownStore.h
//  StateList
//
//  Created by gmcgath on 3/16/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHCSVParser.h"
#import "GMOptions.h"

@interface GMTownStore : NSObject <CHCSVParserDelegate>

- (void) loadStore: (GMOptions *) opts;
- (NSArray *) getTowns;

@end
