//
//  GMIndexViewController.m
//  StateList
//
//  Created by gmcgath on 2/27/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//
//  This class controls the view that lets the user select a state from a list.


#import "GMIndexViewController.h"


@interface GMIndexViewController () {

NSArray *towns;
}

@end

@implementation GMIndexViewController

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
    // This should come from a "state generator."
    //towns = [NSArray arrayWithObjects:@"Bedford", @"Concord", @"Dover", @"Eaton", nil];
    towns = [self getTowns];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Number of cells = number of websites
    return [towns count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Get a cell from the table view.
    UITableViewCell* cell = [tableView
                             dequeueReusableCellWithIdentifier:@"TownCell"];
    if (cell == nil) {
        cell = [UITableViewCell alloc];
        cell = [cell initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TownCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }    // Take the town name and give that to the cell
    NSString* townName = [towns objectAtIndex:indexPath.row];
    cell.textLabel.text = townName;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
       return @"Town";
    }
    else {
        return nil;
    }
}





@end
