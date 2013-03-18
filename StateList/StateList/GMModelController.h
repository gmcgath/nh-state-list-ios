//
//  GMModelController.h
//  StateList
//
//  Created by gmcgath on 2/28/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GMIndexViewController.h"

@interface GMModelController : NSObject

- (GMIndexViewController*) mainController;

@property(strong, nonatomic, readonly) GMIndexViewController *topController;

@end
