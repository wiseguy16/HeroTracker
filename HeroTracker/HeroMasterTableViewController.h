//
//  HeroMasterTableViewController.h
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol APIControllerProtocol

-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse;

@end


@interface HeroMasterTableViewController : UITableViewController

@end
