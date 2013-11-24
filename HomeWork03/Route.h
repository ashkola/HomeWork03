//
//  Route.h
//  HomeWork03
//
//  Created by Admin on 11/10/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Route : NSManagedObject
@property (nonatomic,strong) NSString* route_id;
@property (nonatomic,strong) NSString* route_description;
@property (nonatomic,strong) NSString* route_path;
@property (nonatomic,strong) NSString* route_price;
@property (nonatomic,strong) NSString* route_title;
@property (nonatomic) BOOL isFavorite;
-(Route*)initWithDictionary:(NSDictionary*) dictionary;
@end
