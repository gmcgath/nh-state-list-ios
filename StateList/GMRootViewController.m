//
//  GMRootViewController.m
//  StateList
//
//  Created by gmcgath on 2/27/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import "GMRootViewController.h"
#import "GMIndexViewController.h"
#import "GMModelController.h"


@interface GMRootViewController () {
 
    NSManagedObjectContext *managedObjectContext;
}

@property (readonly, strong, nonatomic) GMIndexViewController *indexController;
@property (strong, nonatomic) GMModelController *modelController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end

@implementation GMRootViewController 

@synthesize managedObjectContext;

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
	// Do any additional setup after loading the view, typically from a nib.

    
    self.modelController = [[GMModelController alloc] init];
    
    
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
