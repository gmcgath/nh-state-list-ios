//
//  GMIndexViewController.m
//  StateList
//
//  Created by Gary McGath on 2/27/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//
//  This class controls the view that lets the user select a town from a list.


#import "GMIndexViewController.h"
#import "GMOptionViewController.h"
#import "GMTownViewController.h"
#import "GMTownStore.h"
#import "GMTown.h"
#import "GMOptions.h"

@interface GMIndexViewController () {

    NSArray *towns;
    GMTownStore *townStore;
    GMOptions *options;
}

@end

@implementation GMIndexViewController


- (void) awakeFromNib
{
    townStore = [[GMTownStore alloc] init];
    options = [[GMOptions alloc] init];
    [townStore loadStore: options];
    if (towns == nil) {
        towns = [townStore getTowns];
    }
    [self configureToolbarItems];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self reinit];
        [self configureToolbarItems];
    } 
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //towns = [townStore getTowns];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    townStore = nil;
    towns = nil;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Number of cells = number of websites
    return [towns count];
}

/* Implementation of GMOptionViewDelegate */
- (void) optionsDidChange:(GMOptions *) options {
    NSLog(@"optionsChanged");
    [self reinit];
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
    if (towns == nil) {
        [self reinit];
    }
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

- (IBAction) doOptions:(id) sender {
    NSLog(@"doOptions");
    [self performSegueWithIdentifier:@"options" sender:sender];
}

- (void)configureToolbarItems
{
    UIBarButtonItem *flexibleSpaceButtonItem = [[UIBarButtonItem alloc]
                                                initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                target:nil action:nil];
    // Create the bar button item
    UIBarButtonItem *optionButtonItem = [[UIBarButtonItem alloc]
                                             initWithTitle:@"Options" style: UIBarButtonItemStyleBordered
                                                 target:self
                                         action:@selector(doOptions:)];
    // Set our toolbar items
    self.toolbarItems = [NSArray arrayWithObjects:
                         flexibleSpaceButtonItem,
                         optionButtonItem,
                         flexibleSpaceButtonItem,
                         nil];
}


/* Call this whenever we have to reinitialize the town data */
- (void) reinit
{
    townStore = [[GMTownStore alloc] init];
    [townStore loadStore: options];
    towns = [townStore getTowns];
    [self.tableView reloadData];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    if([segue.identifier isEqualToString:@"town"]) {
        GMTownViewController *tvc = [segue destinationViewController];
        UITableView *tableView = [self tableView];
        NSIndexPath *indexPath = [tableView indexPathForSelectedRow];
        int row = [indexPath row];
    
        if (towns == nil) {
            [self reinit];
        }
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
    else if([segue.identifier isEqualToString:@"options"]) {
        GMOptionViewController *ovc = [segue destinationViewController];
        [ovc setDelegate:self];
        [ovc setUserOptions:options];
    }

}



@end
