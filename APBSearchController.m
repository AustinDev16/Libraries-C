//
//  APBSearchController.m
//  Libraries-C
//
//  Created by Austin Blaser on 9/28/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBSearchController.h"
#import "APBLibrariesNetworkController.h"
#import "APBLibrary.h"

@interface APBSearchController ()

@property (nonatomic, copy, readwrite) NSArray *internalSearchResults;

@end

@implementation APBSearchController

+(APBSearchController *) sharedController
{
    static APBSearchController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[APBSearchController alloc] init];
    });
    return sharedController;
    
}

-(NSArray *)searchResults
{
    return self.internalSearchResults;
}

-(void)setInternalSearchResults:(NSArray *)internalSearchResults
{
    if (_internalSearchResults != internalSearchResults){
        _internalSearchResults = [internalSearchResults copy];
        
        NSNotification *notification = [NSNotification notificationWithName:@"searchResultsUpdated" object:nil];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        printf("updated internal search results");
    }
}

-(void)searchForLibrariesWithName:(NSString *)name
{
    NSString *searchTerm = [name lowercaseString];
    [[APBLibrariesNetworkController sharedController] fetchResultsForSearchTerm:searchTerm completion:^(NSData *data, NSError *error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!data){ return;}
            NSError *error = nil;
            id jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (![jsonDictionary isKindOfClass:[NSDictionary class]]){ return; }
            APBLibrary *searchResultLibrary = [[APBLibrary alloc] initWithDictionary:jsonDictionary];
            [self setInternalSearchResults:[NSArray arrayWithObject:searchResultLibrary]];
            
        }); // end dispatch
    }]; // end fetchResultsForSearchTerm
}

-(void)clearListOfSearchResults
{
    [self setInternalSearchResults:@[]];
}

@end
