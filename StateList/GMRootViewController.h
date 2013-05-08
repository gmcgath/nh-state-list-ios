//
//  GMRootViewController.h
//  StateList
//
//  Created by gmcgath on 2/27/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface GMRootViewController : UINavigationController
        <UIPageViewControllerDelegate>

// UIPageViewControllerDelegate: https://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UIPageViewControllerDelegateProtocolRef/UIPageViewControllerDelegate.html

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
