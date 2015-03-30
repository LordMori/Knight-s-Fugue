//
//  CharacterCreationViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "CharacterCreationViewController.h"

@interface CharacterCreationViewController ()

@end

@implementation CharacterCreationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Connector customizeBarButton:_cancelUI_B];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    NSLog(@"Class: %@\nMorality: %@", knight.class, knight.morality);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)cancelUI_A:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"cancelPressed"];
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}


@end
