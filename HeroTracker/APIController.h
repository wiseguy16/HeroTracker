//
//  APIController.h
//  HeroTracker
//
//  Created by Gregory Weiss on 8/8/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeroMasterTableViewController.h"

@interface APIController : NSObject

@property (strong, nonatomic) id<APIControllerProtocol> delegate;

-(void)searchGitHubFor:(NSString *)searchTerm;



@end
