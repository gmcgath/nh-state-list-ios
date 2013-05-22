//
//  GMOptionViewDelegate.h
//  StateList
//
//  Created by gmcgath on 5/21/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GMOptions.h"

@protocol GMOptionViewDelegate <NSObject>

- (void) optionsDidChange:(GMOptions *) options;
@end
