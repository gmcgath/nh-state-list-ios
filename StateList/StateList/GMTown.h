//
//  GMTown.h
//  StateList
//
//  Created by gmcgath on 3/18/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GMTown : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *county;
@property () NSInteger pop;
@property () NSInteger latDeg;
@property () NSInteger latMin;
@property () NSInteger latSec;
@property () NSInteger longDeg;
@property () NSInteger longMin;
@property () NSInteger longSec;
@end
