//
//  StateListConstants.h
//  StateList
//
//  Created by Gary McGath on 3/18/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#ifndef StateList_StateListConstants_h
#define StateList_StateListConstants_h

/* The path to the town data file */
NSString *const dataFilePath = @"Towns";

/* Indices of town file fields */
typedef enum TownFieldType : NSInteger TownFieldType;
enum TownFieldType : NSInteger {
    TownName = 0,
    TownCounty,
    TownPopulation,
    TownLatitudeDeg,
    TownLatitudeMin,
    TownLatitudeSec,
    TownLongitudeDeg,
    TownLongitudeMin,
    TownLongitudeSec
};
#endif
