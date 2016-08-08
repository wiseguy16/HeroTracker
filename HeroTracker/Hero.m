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
        aHero.attributionText = heroDict[@"attributionText"]; // credit to Marvel
        
        NSArray *marvelArray = heroDict[@"results"];
        for (NSDictionary *result in marvelArray)
        {
            NSString *name  = result[@"name"];
            aHero.name = name;
            
            NSString *aDescription = result[@"description"];
            aHero.theDescription = aDescription;
            
            NSDictionary *anotherDict = result[@"thumbnail"];
            NSString *aPath = anotherDict[@"path"];
            aHero.imageName = [NSString stringWithFormat:@"%@.jpg", aPath];
        }
        
       // aHero.name =  marvelArray[1];
        
        aHero.homeworld = heroDict[@"homeworld"]; // Not using!!
        
       // aHero.theDescription = heroDict[@"description"];
       // aHero.imageName = heroDict[@"path"];
       
    }
    
    return aHero;
}

@end


/*
 {
 "name": "Thor",
 "homeworld": "Asgard",
 "powers": "Superhuman strength, endurance, and longevity; abilities via Mjolnir: dimensional transportation; electric manipulation; flight; weather manipulation",
 "heroImage": "thor"
 },
 */