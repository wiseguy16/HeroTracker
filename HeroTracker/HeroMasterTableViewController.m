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
    
    //int selectedRow = indexPath.row;
    //NSLog(@"touch on row %d", selectedRow);
    
    /*
    Yourstring=[catagorry objectAtIndex:indexPath.row];
    
    //Pushing next view
    cntrSecondViewController *cntrinnerService = [[cntrSecondViewController alloc] initWithNibName:@"cntrSecondViewController" bundle:nil];
    [self.navigationController pushViewController:cntrinnerService animated:YES];
     */
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
// One tiny change

@end
