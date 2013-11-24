//
//  AppDelegate.h
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vehicle.h"
#import <CoreData/CoreData.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectModel* managedModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator* storeCoordinator;
@property (strong, nonatomic) NSManagedObjectContext* objectContext;
@end
