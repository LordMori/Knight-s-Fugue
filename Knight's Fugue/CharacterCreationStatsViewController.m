//
//  CharacterCreationStatsViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "CharacterCreationStatsViewController.h"

@implementation CharacterCreationStatsViewController

SavedGameData *sgd;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(popToRootView)];
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createNewGame)];
    [Connector customizeBarButton:self.tabBarController.navigationItem.leftBarButtonItem];
    [Connector customizeBarButton:self.tabBarController.navigationItem.rightBarButtonItem];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedSGD"];
    sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    NSLog(@"Class: %@\nMorality: %@", knight.class, knight.morality);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)popToRootView{
    [Connector createAlertController:self title:@"Cancel Character Creation?" message:@"All data will be lost if cancelled"];
}

- (void)createNewGame {
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"gameSaved"];
    [[NSUserDefaults standardUserDefaults] setObject:[sgd toDictionary] forKey:@"savedGame"];
    
    NSLog(@"Create New Game");
}

@end
