//
//  GMMapViewController.m
//  NH Towns
//
//  Created by Gary McGath on 5/8/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import "GMMapViewController.h"
#import "GMMapView.h"

@interface GMMapViewController ()

@end

@implementation GMMapViewController

@synthesize latitude;
@synthesize longitude;
@synthesize mapView;

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
    UIView *view = [self view];
    GMMapView *gmmapView = (GMMapView *)view;
    [gmmapView setLongitude:longitude];
    [gmmapView setLatitude:latitude];
}

- (void)viewWillAppear:(BOOL)animated {
    CLLocationCoordinate2D centerLocation;
    centerLocation.latitude = latitude;
    centerLocation.longitude= longitude;
    // Set view region 4 KM on a side centered on the town's nominal location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(centerLocation, 7500, 7500);
    [mapView setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
