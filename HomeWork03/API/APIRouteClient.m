//
//  APIRouteClient.m
//  HomeWork03
//
//  Created by Admin on 11/10/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "APIRouteClient.h"
#define gBaseURL @"http://itomy.ch/"
@implementation APIRouteClient
+(APIRouteClient*)getClient{
    return [[APIRouteClient alloc] initWithBaseURL:[NSURL URLWithString:gBaseURL]];
}
-(void)updateRouteList:(void (^)(NSArray *))successBlock failure:(void (^)(NSError*))failureBlock{
    [self getPath:@"routes.php" parameters:(NSDictionary *) success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successBlock(NSArray* responseObject)
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failureBlock(NSError* error)
    }];
}
@end
