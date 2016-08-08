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
@property (nonatomic) NSString *homeworld; //Not using!!!
//@property (nonatomic) NSString *theDescription;
@property (nonatomic) NSString *theDescription;
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *attributionText; // Credit to Marvel

+ (Hero *)heroWithDictionary:(NSDictionary *)heroDict;

@end


