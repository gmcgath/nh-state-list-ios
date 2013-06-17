//
//  GMTownViewController.m
//  StateList
//
//  Created by Gary McGath on 3/18/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import "GMTownViewController.h"
#import "GMTownView.h"
#import "GMMapViewController.h"

/* Turn longitude or latitude into degrees, minutes, and seconds into
 longitude/latitude as real number */
static float dmsToFloat(int deg, int min, int sec) {
    return (float) deg + (float) min / 60.0 + (float) sec / 3600.0;
}

@interface GMTownViewController ()

@end


@implementation GMTownViewController

@synthesize townName;
@synthesize county;
@synthesize townPop;
@synthesize townLatDeg;
@synthesize townLatMin;
@synthesize townLatSec;
@synthesize townLongDeg;
@synthesize townLongMin;
@synthesize townLongSec;

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
    [view setContentMode: UIViewContentModeRedraw];  // force redraw on rotate

    GMTownView *tView = (GMTownView *) view;
    [tView setTownName:townName];
    
    NSMutableString *countyStr = [NSMutableString stringWithString:@"County: "];
    [countyStr appendString:county];
    [tView setCounty:countyStr];
    
    NSMutableString *popStr = [NSMutableString stringWithString:@"Population: "];
    [popStr appendString:[NSString stringWithFormat:@"%d", townPop]];
    [tView setPopulation:popStr];

    NSMutableString *longStr = [NSMutableString stringWithString:@"Longitude: "];
    [longStr appendString:[NSString stringWithFormat:@"%d°%d'%d'' W",
                          townLongDeg, townLongMin, townLongSec]];
    [tView setLongitude:longStr];

    NSMutableString *latStr = [NSMutableString stringWithString:@"Latitude: "];
    [latStr appendString:[NSString stringWithFormat:@"%d°%d'%d'' N",
                           townLatDeg, townLatMin, townLatSec]];
    [tView setLatitude:latStr];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    GMMapViewController *mvc = [segue destinationViewController];
    float lat = dmsToFloat(townLatDeg, townLatMin, townLatSec);
    float lng = -dmsToFloat(townLongDeg, townLongMin, townLongSec);
    [mvc setLatitude:lat];
    [mvc setLongitude:lng];
}



@end
