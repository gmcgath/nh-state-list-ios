//
//  StateListConstants.h
//  StateList
//
//  Created by gmcgath on 3/18/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#ifndef StateList_StateListConstants_h
#define StateList_StateListConstants_h

/* The path to the town data file */
NSString *const dataFilePath = @"DataFiles/TownDB";

/* Indices of town file fields */
typedef enum TownFieldType : NSInteger TownFieldType;
enum TownFieldType : NSInteger {
    TownName = 0,
    TownPopulation,
    TownLatitudeDeg,
    TownLatitudeMin,
    TownLatitudeSec,
    TownLongitudeDeg,
    TownLongitudeMin,
    TownLongitudeSec
};
#endif
