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


-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = [dictionary valueForKey:@"name"];
    NSString *summary = [dictionary valueForKey:@"description"];
    NSString *language = [dictionary valueForKey:@"language"];
    NSString *homepageURL = [dictionary valueForKey:@"homepage"];
    NSString *starsString = [dictionary valueForKey:@"stars"]; // can I cast this directly?
    
    NSInteger numberOfStars = [starsString integerValue];
    BOOL complete = (name && summary && language && homepageURL && numberOfStars);
    self = [super init];
    if (self && complete){
        _name = name;
        _summary = summary;
        _language = language;
        _homepageURL = homepageURL;
        _numberOfStars = numberOfStars;
    }
    return self;
}
@end
