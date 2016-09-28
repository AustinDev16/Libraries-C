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
#import "APBSearchController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[APBSearchController sharedController] searchForLibrariesWithName:@"grunt"];
    
    return YES;
}


@end
