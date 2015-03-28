//
//  ViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "MainMenuViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    
    if(sgd != nil && knight != nil){
        _savedGameLabel.text = [NSString stringWithFormat:@"Class: %@  Save Time: %@",[knight.class capitalizedString], sgd.saveDate];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated{
    if([[NSUserDefaults standardUserDefaults] boolForKey:@"cancelPressed"]){
        [[NSUserDefaults standardUserDefaults] setBool:false forKey:@"cancelPressed"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadGameUI_A:(id)sender {
}

- (IBAction)gameNewUI_A:(id)sender {
    [self performSegueWithIdentifier:@"showQuestionnaire" sender:sender];
}


@end
