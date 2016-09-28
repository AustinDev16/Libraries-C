//
//  APBLibrariesNetworkController.m
//  Libraries-C
//
//  Created by Austin Blaser on 9/27/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBLibrariesNetworkController.h"

@interface APBLibrariesNetworkController()


@end

static NSString *apiKey = @"913fe7b39409b4a97f116b4b3d40cd5b";
//https://libraries.io/api/:platform/:name?api_key=YOUR_API_KEY
// https://libraries.io/api/npm/grunt?api_key=YOUR_API_KEY
@implementation APBLibrariesNetworkController


+(APBLibrariesNetworkController *)sharedController
{
    static APBLibrariesNetworkController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[APBLibrariesNetworkController alloc] init];
    });
    return sharedController;
}

-(NSURL *)urlFromURLParametersWithBaseURL:(NSURL *)baseURL search:(NSString *)search {
    
    
    NSURL *base = [baseURL URLByAppendingPathComponent:search];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:base resolvingAgainstBaseURL:YES];
    NSURLQueryItem *query = [NSURLQueryItem queryItemWithName:@"913fe7b39409b4a97f116b4b3d40cd5b" value:nil];
    components.queryItems = [NSArray arrayWithObjects:query, nil];
    
    return components.URL;
    
}

-(void)fetchResultsForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSData *, NSError *))completion
{
    // perform network call
    
    // prepare search term
    
    NSString *search = [searchTerm lowercaseString];
    NSString *urlString = @"https://libraries.io/api/npm";
    NSURL *baseURL = [NSURL URLWithString:urlString];
    NSURL *requestURL = [self urlFromURLParametersWithBaseURL:baseURL search:search];
    // prepare URL
  
    NSLog(@"%@", requestURL.absoluteString);
    
//    
  
    
    
    
    
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:requestURL];
    request.HTTPMethod = @"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        completion(data, error);
    }];
    [dataTask resume];

//    [someObject someMethodThatTakesABlock:^returnType (parameters) {...}];

    

}


@end
