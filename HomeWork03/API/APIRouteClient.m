//
//  APIRouteClient.m
//  HomeWork03
//
//  Created by Admin on 11/10/13.
//  Copyright (c) 2013 Admin. All rights reserved.
//

#import "APIRouteClient.h"
#import "AFNetworking.h"
#define gBaseURL @"http://itomy.ch/"
@implementation APIRouteClient

+(APIRouteClient*)getClient{
    static APIRouteClient *client;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[APIRouteClient alloc] initWithBaseURL:[NSURL URLWithString:gBaseURL]];
    });
    return client;
}

- (id)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    if (self) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    } else {
        self = nil;
    }
    return self;
}

-(void)updateRouteList:(void (^)(NSArray * routes))successBlock failure:(void (^)(NSError* routes))failureBlock{
    
    [self getPath:@"routes.php"
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
            successBlock((NSArray *)responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failureBlock((NSError*) error);
        }];
}
@end
