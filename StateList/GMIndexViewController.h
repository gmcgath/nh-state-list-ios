//
//  GMIndexViewController.h
//  StateList
//
//  Created by Gary McGath on 2/27/13.
//  Copyright (c) 2013 Gary McGath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GMOptionViewDelegate.h"

@interface GMIndexViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate,
    UINavigationControllerDelegate, GMOptionViewDelegate>


@property (weak, nonatomic) IBOutlet UIBarButtonItem *optionsButton;

@end
