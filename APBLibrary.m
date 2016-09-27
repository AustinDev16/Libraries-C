//
//  APBLibrary.m
//  Libraries-C
//
//  Created by Austin Blaser on 9/27/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import "APBLibrary.h"

@implementation APBLibrary

-(instancetype)initWithName:(NSString *)name summary:(NSString *)summary language:(NSString *)language homepageURL:(NSString *)homepageURL numberOfStars:(NSInteger)numberOfStars
{
    self = [super init];
    if (self){
        _name = [name copy];
        _summary = [summary copy];
        _language = [language copy];
        _homepageURL = [homepageURL copy];
        _numberOfStars = numberOfStars;
    }
    return self;
}

@end
