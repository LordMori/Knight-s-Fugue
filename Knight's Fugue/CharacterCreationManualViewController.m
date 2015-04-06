//
//  CharacterCreationManualViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 4/5/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "CharacterCreationManualViewController.h"

@implementation CharacterCreationManualViewController

SavedGameData *sgd;
Knight *knight;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(popToRootView)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createNewGame)];
    [Connector customizeBarButton:self.navigationItem.leftBarButtonItem];
    [Connector customizeBarButton:self.navigationItem.rightBarButtonItem];
    
}

- (void)createNewGame {
    
    if(sgd != nil && knight != nil){
        sgd.knight = [knight toDictionary];
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"gameSaved"];
        [[NSUserDefaults standardUserDefaults] setObject:[sgd toDictionary] forKey:@"savedGame"];
    
        NSLog(@"Create New Game");
    }else{
        NSLog(@"Not ready to create");
    }
}

- (void)popToRootView{
    [Connector createCancelAlertController:self title:@"Cancel Character Creation?" message:@"All data will be lost if cancelled"];
}


@end
