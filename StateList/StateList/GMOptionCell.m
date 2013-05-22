//
//  GMOptionCell.m
//  StateList
//
//  Created by gmcgath on 5/20/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMOptionCell.h"

/** In order to have outlets from prototype cells, it's necessary to
    subclass the cell so that the outlet is in the class. 
 */
@implementation GMOptionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
