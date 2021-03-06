//
//  GMMapViewController.h
//  NH Towns
//
//  Created by Gary McGath on 5/8/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MKMapView.h>

@interface GMMapViewController :
UIViewController
<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property CGFloat latitude;
@property CGFloat longitude;
@end
