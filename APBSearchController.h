//
//  APBSearchController.h
//  Libraries-C
//
//  Created by Austin Blaser on 9/28/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APBSearchController : NSObject

+ (APBSearchController *) sharedController;

@property (nonatomic, copy, readonly) NSArray *searchResults;

-(void)searchForLibrariesWithName:(NSString *)name;
-(void)clearListOfSearchResults;


@end
