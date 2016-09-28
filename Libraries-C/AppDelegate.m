//
//  AppDelegate.m
//  Libraries-C
//
//  Created by Austin Blaser on 9/27/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "AppDelegate.h"
#import "APBLibrariesNetworkController.h"
#import "APBLibrary.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[APBLibrariesNetworkController sharedController] fetchResultsForSearchTerm:@"Grunt" completion:^(NSData *data, NSError *error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!data) { return; }
            
            NSError *error = nil; // do
            id jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error]; // why the ampersand? address to error
            
            if (jsonDictionary == nil){
                // catch block
            }
            
            
            if (![jsonDictionary isKindOfClass:[NSDictionary class]]) { return; }
            //NSDictionary *parsedResults = jsonDictionary;
            // NSString *name = [parsedResults valueForKey:@"name"];
            
            APBLibrary *searchResult = [[APBLibrary alloc] initWithDictionary:jsonDictionary];
            NSLog(@"%@ %@ %@ %@", searchResult.name, searchResult.summary, searchResult.language, @(searchResult.numberOfStars));
            
            
            
            //NSLog(@"%@", data);
            // printf("Hey");
        });
        
        
    }];
    
    //    [someObject someMethodThatTakesABlock:^returnType (parameters) {...}];
    
    
    
    return YES;
}


@end
