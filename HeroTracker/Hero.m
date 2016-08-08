//
//  Hero.m
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "Hero.h"
#import "HeroMasterTableViewController.h"

@implementation Hero

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict
{
    Hero *aHero = nil;
    if (heroDict)
    {
        aHero = [[Hero alloc] init];
        aHero.attributionText = [heroDict objectForKey:@"attributionText"]; // credit to Marvel
        
        NSDictionary *dataDict = heroDict[@"data"];
        
        NSArray *marvelArray = dataDict[@"results"];
        for (NSDictionary *result in marvelArray)
        {
            NSString *name  = result[@"name"];
            aHero.name = name;
            
            NSString *aDescription = result[@"description"];
            aHero.theDescription = aDescription;
            
            NSDictionary *anotherDict = result[@"thumbnail"];
            NSString *aPath = anotherDict[@"path"];
            aHero.imageName = [NSString stringWithFormat:@"%@.jpg", aPath];
            
            NSDictionary *comicsDict = result[@"comics"];
            aHero.appearances = comicsDict[@"available"];
        }
        
    }
    
    return aHero;
}

@end
