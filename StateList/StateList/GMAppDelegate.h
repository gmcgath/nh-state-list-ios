//
//  GMAppDelegate.h
//  StateList
//
//  Created by gmcgath on 2/27/13.
//  Copyright (c) 2013 mcgath.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;



//- (NSURL *)applicationDocumentsDirectory;

// - (void)saveContext;

@end
