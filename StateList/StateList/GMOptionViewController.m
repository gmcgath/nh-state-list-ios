//
//  GMOptionViewController.m
//  StateList
//
//  Created by gmcgath on 3/21/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMOptionViewController.h"
#import "GMOptionCell.h"

@interface GMOptionViewController ()

@end

NSString *showNorthCellID = @"showNorthCell";
NSString *showNorthSwitchID = @"showNorthSwitch";
NSString *showMiddleCellID = @"showMiddleCell";
NSString *showMiddleSwitchID = @"showMiddleSwitch";
NSString *showSouthCellID = @"showSouthCell";
NSString *showSouthSwitchID = @"showSouthSwitch";

@implementation GMOptionViewController

@synthesize northSelected;
@synthesize middleSelected;
@synthesize southSelected;
@synthesize northSwitch;
@synthesize middleSwitch;
@synthesize southSwitch;
@synthesize userOptions;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 3    ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;

{
    NSString *cellID = @"";
    GMOptionCell *cell = nil;
    switch (indexPath.row) {
        case 0:
            cellID = showNorthCellID;
            cell = [cv dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
            [self setNorthSwitch:cell.northSwitch];
            [northSwitch setOn:[userOptions showNorth]];
            break;
        case 1:
            cellID = showMiddleCellID;
            cell = [cv dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
            [self setMiddleSwitch:cell.middleSwitch];
            [middleSwitch setOn:[userOptions showMiddle]];
            break;
        case 2:
            cellID = showSouthCellID;
            cell = [cv dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
            [self setSouthSwitch:cell.southSwitch];
            [southSwitch setOn:[userOptions showSouth]];
            break;
    }
    return cell;
    
}




- (IBAction)toggleNorth:(UISwitch *)sender {
    NSLog(@"toggleNorth");
    [userOptions setShowNorth:sender.on];
    [delegate optionsDidChange:userOptions];
}

- (IBAction)toggleMiddle:(UISwitch *)sender {
    [userOptions setShowMiddle:sender.on];
    [delegate optionsDidChange:userOptions];
}

- (IBAction)toggleSouth:(UISwitch *)sender {
    [userOptions setShowSouth:sender.on];
    [delegate optionsDidChange:userOptions];
}

@end
