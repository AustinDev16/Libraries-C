//
//  APBLibrariesNetworkController.h
//  Libraries-C
//
//  Created by Austin Blaser on 9/27/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APBLibrariesNetworkController;

@interface APBLibrariesNetworkController : NSObject

+(APBLibrariesNetworkController *) sharedController;

-(void)fetchResultsForSearchTerm:(NSString *)searchTerm completion:(void (^)(NSData *data, NSError *error))completion;

@end
