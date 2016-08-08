//
//  HeroMasterTableViewController.m
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "HeroMasterTableViewController.h"
#import "HeroDetailViewController.h"
#import "Hero.h"

@interface HeroMasterTableViewController ()

@property NSMutableArray *heroes;

@end

@implementation HeroMasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.title = @"S.H.I.E.L.D. Hero Tracker";    // DID THIS IN STORYBOARD
    
    /*
     Your public key
     
     e739fa38cc0c96087a3886327d580973
     
     Your private key
     
     daaabe6580b3169ade2709339b0a7bb943930fa6
     */
    
    self.heroes = [[NSMutableArray alloc] init];
    
// ******************WE HAVE TO CALL-----loadHeroes method********************
    
    [self loadHeroes];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Get hero objects outof the JSON and load them all in a NSDictionary

- (void)loadHeroes
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSArray *heroesArrayForJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    for (NSDictionary *aDict in heroesArrayForJSON)
    {
        
        Hero *aHero = [Hero heroWithDictionary:aDict];
        [self.heroes addObject:aHero];
        
    }
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [self.heroes sortUsingDescriptors:[NSArray arrayWithObject:sort]];
    [self.tableView reloadData];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.heroes.count;
}

// ********************WE WILL NEED THIS METHOD!!!************************

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeroCell" forIndexPath:indexPath];
    
    Hero *aHero = self.heroes[indexPath.row];
    
    // Configure the cell...
    cell.textLabel.text = aHero.name;
    cell.detailTextLabel.text = aHero.homeworld;
    
    return cell;
}


// *******************WE WILL NEED METHOD didSelectRowAtIndexPath****************

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HeroDetailViewController *newHeroVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HeroDetailVC"];
    [[self navigationController] pushViewController:newHeroVC animated:YES];
    
    Hero *selectedHero = self.heroes[indexPath.row];
    newHeroVC.hero = selectedHero;
    
    
    /*
    
    //Pushing next view
    cntrSecondViewController *cntrinnerService = [[cntrSecondViewController alloc] initWithNibName:@"cntrSecondViewController" bundle:nil];
    [self.navigationController pushViewController:cntrinnerService animated:YES];
     */
    
}


// One tiny change

@end
