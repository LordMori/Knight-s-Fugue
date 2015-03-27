//
//  MoralityViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "MoralityViewController.h"

@interface MoralityViewController ()

@end

@implementation MoralityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    NSLog(@"Class: %@", knight.class);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelUI_A:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"cancelPressed"];
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}


@end
