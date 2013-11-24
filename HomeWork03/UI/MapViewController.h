//
//  MapViewController.h
//  HomeWork03
//
//  Created by Admin on 11/4/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"
@interface MapViewController : UIViewController
- (IBAction)singleTapAction:(id)sender;
@property (weak, nonatomic) Route *mapRoute;
@end
