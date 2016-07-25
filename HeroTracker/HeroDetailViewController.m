//
//  HeroDetailViewController.m
//  HeroTracker
//
//  Created by Gregory Weiss on 7/25/16.
//  Copyright © 2016 Gregory Weiss. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()


// ADD PROPERTIES AND CONECTIONS HERE!!!!
@property (weak, nonatomic) IBOutlet UILabel *heroNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroHomeWorldLabel;
@property (weak, nonatomic) IBOutlet UILabel *heroPowersLabel;
@property (weak, nonatomic) IBOutlet UIImageView *heroImageView;

- (void)configureView;

@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Managing the detail view

- (void)setHero:(Hero *)newHero
{
    if (_hero != newHero)
    {
        _hero = newHero;
        
        // Update the view.
        [self configureView];
    }
}


#pragma mark - Configure the view

- (void)configureView
{
    // What is being checked here?
    if (self.hero) // This is to is an agent object does exist.
    {
      
        //
        // 20. Once we have the last name of the agent from the code above, how do we set the view's title to the right
        //     string?
        //
        self.title = [NSString stringWithFormat: @"HERO"]; // FIX THIS!!!----FIXED!!
        
        
        //
        // 21. We need to set the three labels in our view to the agent's cover name, real name, and access label.
        //
        //     The level label will be a little trickier, because the level property is an NSInteger. We also want that label
        //     to read "Level #". How do we do that?
        //
        self.heroNameLabel.text = self.hero.name;
        self.heroHomeWorldLabel.text = self.hero.homeworld;
        self.heroPowersLabel.text = self.hero.powers;
       // self.heroImageView.image = [UIImage imageNamed:imageName];
        
        
        
    }
}

@end
