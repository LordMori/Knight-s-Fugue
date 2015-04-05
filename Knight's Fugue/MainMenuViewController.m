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
    
    [self.navigationController setNavigationBarHidden:YES];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    self.navigationController.navigationBar.translucent = FALSE;
    
//    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
//    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
//    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
//    
//    if(sgdDict != nil && sgd != nil && knight != nil){
//        _savedGameLabel.text = [NSString stringWithFormat:@"Name: %@ Class: %@  Save Time: %@",[knight.class capitalizedString], sgd.saveDate];
//    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    
    if(sgdDict != nil && sgd != nil && knight != nil){
        _savedGameLabel.text = [NSString stringWithFormat:@"Name: %@  Class: %@  Saved: %@",knight.name,[knight.class capitalizedString], sgd.saveDate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loadGameUI_A:(id)sender {
    [self performSegueWithIdentifier:@"showLoadGame" sender:sender];
}

- (IBAction)gameNewUI_A:(id)sender {
    [self performSegueWithIdentifier:@"showQuestionnaire" sender:nil];
}


@end
