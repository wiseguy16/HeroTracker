//
//  Hero.h
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *homeworld;
@property (nonatomic) NSString *powers;
@property (nonatomic) NSString *imageName;

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end


