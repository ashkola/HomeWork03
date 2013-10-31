//
//  Vehicle.h
//  HomeWork03
//
//  Created by Admin on 10/31/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "Transport.h"

@interface Vehicle : Transport
@property NSNumber* price;
+(Vehicle*)getVehicleWithName:(NSString*)name price:(NSNumber*)price;
@end
