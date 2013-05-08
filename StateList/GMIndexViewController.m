//
//  GMIndexViewController.m
//  StateList
//
//  Created by gmcgath on 2/27/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//
//  This class controls the view that lets the user select a state from a list.


#import "GMIndexViewController.h"
#import "GMTownViewController.h"
#import "GMTownStore.h"
#import "GMTown.h"

@interface GMIndexViewController () {

    NSArray *towns;
    GMTownStore *townStore;
}

@end

@implementation GMIndexViewController


- (void) awakeFromNib
{
    townStore = [[GMTownStore alloc] init];
    [townStore loadStore];
    [self configureToolbarItems];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        townStore = [[GMTownStore alloc] init];
        [townStore loadStore];
        [self configureToolbarItems];
    } 
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    towns = [townStore getTowns];
    
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
    GMTown *town = [towns objectAtIndex:indexPath.row];
    NSString* townText = [town name];
    cell.textLabel.text = townText;
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

- (void)configureToolbarItems
{
    UIBarButtonItem *flexibleSpaceButtonItem = [[UIBarButtonItem alloc]
                                                initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                target:nil action:nil];
    // Create the bar button item for the segmented control
    UIBarButtonItem *optionButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Options" style: UIBarButtonItemStyleBordered
                                                 target:nil
                                                 action:nil];
    // Set our toolbar items
    self.toolbarItems = [NSArray arrayWithObjects:
                         flexibleSpaceButtonItem,
                         optionButtonItem,
                         flexibleSpaceButtonItem,
                         nil];
}

/*
- (void)tableView:(UITableView *)tableView
             didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger indexes[1];
    [indexPath getIndexes:indexes];
    GMTown *town = [towns objectAtIndex:indexes[0]];
    //[[self navigationController] pushViewController:someController animated:TRUE];
    
    // Shouldn't have to do this. How do I grab the push "segue"?
   // UIViewController *townView = [[GMTownViewController alloc]
    //                              initWithNibName:@"Whatsitcalled" bundle:nil];
}
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GMTownViewController *tvc = [segue destinationViewController];
    UITableView *tableView = [self tableView];
    NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
    int row = [indexPath row];
    GMTown *destTown = [towns objectAtIndex:row];
    [tvc setTownName:[destTown name]];
    [tvc setCounty:[destTown county]];
    [tvc setTownPop:[destTown pop]];
    [tvc setTownLongDeg:[destTown longDeg]];
    [tvc setTownLongMin:[destTown longMin]];
    [tvc setTownLongSec:[destTown longSec]];
    [tvc setTownLatDeg:[destTown latDeg]];
    [tvc setTownLatMin:[destTown latMin]];
    [tvc setTownLatSec:[destTown latSec]];
}



@end
