//
//  GMOptionViewController.h
//  StateList
//
//  Created by gmcgath on 3/21/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMOptions.h"
#import "GMOptionViewDelegate.h"

@interface GMOptionViewController : UICollectionViewController
    <UICollectionViewDataSource>

@property GMOptions *userOptions;
@property BOOL northSelected;
@property BOOL middleSelected;
@property BOOL southSelected;
@property (weak, nonatomic) IBOutlet UISwitch *northSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *middleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *southSwitch;
@property (assign) id<GMOptionViewDelegate> delegate;

- (IBAction)toggleNorth:(UISwitch *)sender;
- (IBAction)toggleMiddle:(UISwitch *)sender;
- (IBAction)toggleSouth:(UISwitch *)sender;


@end
