//
//  Vehicle.m
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle
+(Vehicle*)getVehicleWithName:(NSString*)name price:(NSNumber*)price
{
    Vehicle* result = [[Vehicle alloc] init];
    result.price = price;
    result.name = name;	
    return result;
}
@end
