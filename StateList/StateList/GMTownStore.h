//
//  GMTownStore.h
//  StateList
//
//  Created by Gary McGath on 3/16/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CHCSVParser.h"
#import "GMOptions.h"

@interface GMTownStore : NSObject <CHCSVParserDelegate>

- (void) loadStore: (GMOptions *) opts;
- (NSArray *) getTowns;

@end
