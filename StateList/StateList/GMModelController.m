//
//  GMModelController.m
//  StateList
//
//  Created by gmcgath on 2/28/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

/**
 The model controller provides the logic for transitions among views. It does 
 not provide a data source, but rather selects a next view according to the action.
 At this point I have very little idea just what that means.
 */
#import "GMModelController.h"
#import "GMIndexViewController.h"

@interface GMModelController()



@end

@implementation GMModelController

- (id) init
{
    self = [super init];
    _topController = [[GMIndexViewController alloc] init];
    return self;
}

- (GMIndexViewController*) mainController
{
    return _topController;
}
@end
