//
//  LoadSaveGameViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/30/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "LoadSaveGameViewController.h"

@implementation LoadSaveGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Connector customizeBarButton:_cancelUI_B];
    [Connector customizeBarButton:_loadUI_B];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)loadUI_A:(id)sender {

}

- (IBAction)cancelUI_A:(id)sender {
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end
