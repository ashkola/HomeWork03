//
//  APIRouteClient.h
//  HomeWork03
//
//  Created by Admin on 11/10/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "AFHTTPClient.h"

@interface APIRouteClient : AFHTTPClient
+(APIRouteClient*)getClient;
-(void) updateRouteList:(void (^)(NSArray* routes))successBlock failure:(void (^)(NSError* error))failureBlock;
@end
