//
//  Route.m
//  HomeWork03
//
//  Created by Admin on 11/10/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "Route.h"

@implementation Route

-(Route*)initWithDictionary:(NSDictionary *)dictionary{
    self.route_description = [dictionary objectForKey:@"route_description"];
    self.route_id = [dictionary objectForKey:@"route_id"];
    self.route_path = [dictionary objectForKey:@"route_path"];
    self.route_price = [dictionary objectForKey:@"route_price"];
    self.route_title = [dictionary objectForKey:@"route_title"];
    self.isFavorite = NO;
    return self;
}

@end
