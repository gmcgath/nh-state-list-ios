//
//  GMTownViewController.h
//  StateList
//
//  Created by gmcgath on 3/18/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMTownViewController : UIViewController
    <UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *mapButton;

@property (strong) NSString *townName;
@property NSInteger townPop;
@property (strong) NSString *county;
@property NSInteger townLatDeg;
@property NSInteger townLatMin;
@property NSInteger townLatSec;
@property NSInteger townLongDeg;
@property NSInteger townLongMin;
@property NSInteger townLongSec;
@end
