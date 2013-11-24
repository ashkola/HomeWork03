//
//  AppDelegate.m
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.tintColor = [UIColor blackColor];
    self.managedModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    self.storeCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedModel];
    NSError *error;
    NSString* storePath = [[self applicationDirectory] stringByAppendingPathComponent:@"Routes.sqlite"];
    if (![self.storeCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:storePath] options:nil 	error:&error]) {
        NSLog(@"%@",error);
    };
    self.objectContext = [[NSManagedObjectContext alloc]init];
    [self.objectContext setPersistentStoreCoordinator:self.storeCoordinator];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}
#pragma mark - Internal Logic
-(NSString*)applicationDirectory{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}


@end
