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
#import "APIController.h"

@interface HeroMasterTableViewController () <APIControllerProtocol, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;

@property NSMutableArray *heroes;

@end

@implementation HeroMasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    APIController *apiController = [APIController sharedAPIController];
//    apiController.delegate = self;
//    [apiController searchForCharacter:@"Spider-Man"]; // This was here to check api!
//    self.title = @"S.H.I.E.L.D. Hero Tracker";    // DID THIS IN STORYBOARD
    
    
    self.heroes = [[NSMutableArray alloc] init];
    
// ******************WE HAVE TO CALL-----loadHeroes method********************
    
 //   [self loadHeroes];  // ****NOT using since API works!!!
    
 }

#pragma mark - Get hero objects outof the JSON and load them all in a NSDictionary

- (void)loadHeroes // *******This is here just to see if I'm reading JSON correctly!!!!
{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"heroes" ofType:@"json"];
    // This is a built in method that allows us to load a JSON file into native Cocoa objects (NSDictionaries and NSArrays).
    NSDictionary *heroesDictForJSON = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    if (heroesDictForJSON)
    {
            Hero *aHero = [Hero heroWithDictionary:heroesDictForJSON];
            [self.heroes addObject:aHero];
    }
    
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
    cell.detailTextLabel.text = aHero.attributionText;
    
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
    
}

-(void)didReceiveAPIResults:(NSDictionary *)gitHubResponse
{
    Hero *aHero = [Hero heroWithDictionary:gitHubResponse];
    [self.heroes addObject:aHero];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
    
}

#pragma mark - Search bar method

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    // called when keyboard search button pressed
    
    if ([self.mySearchBar.text  isEqual: @""])
    {
        return;
    }
    [self doSearch:self.mySearchBar.text];
    
}

#pragma mark - Using api inside of a custom search method

-(void)doSearch:(NSString *)searchThisMarvel
{
    [self.mySearchBar resignFirstResponder];
    APIController *apiController = [APIController sharedAPIController];
    apiController.delegate = self;
    [apiController searchForCharacter:searchThisMarvel];
    self.mySearchBar.text = @"";
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.tableView reloadData];
//    });
    
    // search: searchThisMarvel
    
}

#pragma mark - Cancel button to resign typing

- (IBAction)cancelTapped:(UIBarButtonItem *)sender
{
     [self.mySearchBar resignFirstResponder];
    self.mySearchBar.text = @"";
}

// One tiny change

@end
