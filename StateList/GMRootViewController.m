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
    // Configure the page view controller and add it as a child view controller.
    
    // I don't actually need a page view controller, do I?
    /*
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController = [self.pageViewController init];
    self.pageViewController.delegate = self;
     */
    
    self.modelController = [[GMModelController alloc] init];
    
    GMIndexViewController *startingViewController = [self.modelController mainController];
    // For the moment we have just one view controller
    
/*    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
    CGRect pageViewRect = self.view.bounds;
    self.pageViewController.view.frame = pageViewRect;
    
    [self.pageViewController didMoveToParentViewController:self];
  */  
    // Add the page view controller's gesture recognizers to the book view controller's
    // view so that the gestures are started more easily.
    // self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    
//    [self addChildViewController:self.pageViewController];
//    [self.view addSubview:self.pageViewController.view];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
