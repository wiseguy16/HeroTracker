//
//  Hero.m
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "Hero.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *aHero = nil;
    if (heroDict)
    {
        aHero = [[Hero alloc] init];
        aHero.name = [heroDict objectForKey:@"name"];
        aHero.homeworld = heroDict[@"homeworld"];
        aHero.powers = heroDict[@"powers"];
      //  aHero.image = [heroDict initWithContentsOfFile:@"heroImage"];
    }
    
    return aHero;
}

@end
