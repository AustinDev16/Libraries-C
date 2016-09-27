//
//  APBLibrary.h
//  Libraries-C
//
//  Created by Austin Blaser on 9/27/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APBLibrary : NSObject

-(instancetype)initWithName:(NSString *)name summary:(NSString *)summary language:(NSString *)language homepageURL:(NSString *)homepageURL numberOfStars:(NSInteger)numberOfStars;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *homepageURL;
@property (nonatomic) NSInteger numberOfStars;

@end


