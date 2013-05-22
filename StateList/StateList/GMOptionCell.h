//
//  GMOptionCell.h
//  StateList
//
//  Created by gmcgath on 5/20/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMOptionCell : UICollectionViewCell

/* Having all the switch variables in each instance is a bit
   inelegant, but it seems to simplify getting the switch properties 
   elsewhere. */
@property (weak, nonatomic) IBOutlet UISwitch *northSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *middleSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *southSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *theSwitch;

@end
