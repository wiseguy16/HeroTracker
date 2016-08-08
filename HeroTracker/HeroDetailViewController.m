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
   
    if (self.hero)
    {
        self.title = [NSString stringWithFormat: @"HERO"];
        
        self.heroNameLabel.text = self.hero.name;
        self.heroHomeWorldLabel.text = [NSString stringWithFormat: @"Appears in %@ comics!", self.hero.appearances];
        self.heroPowersLabel.text = self.hero.theDescription;
        NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:self.hero.imageName]];
        
        self.heroImageView.image = [UIImage imageWithData: imageData]; // This should probably be done async????
        
    }
}

@end
