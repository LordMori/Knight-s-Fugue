//
//  CharacterCreationOverviewViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 3/23/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "CharacterCreationOverviewViewController.h"

@interface CharacterCreationOverviewViewController ()

@end

@implementation CharacterCreationOverviewViewController

SavedGameData *sgd;
Knight *knight;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(popToRootView)];
    self.tabBarController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createNewGame)];
    [Connector customizeBarButton:self.tabBarController.navigationItem.leftBarButtonItem];
    [Connector customizeBarButton:self.tabBarController.navigationItem.rightBarButtonItem];
        
    [self presentDetailLabel:@"Click on attribute to learn more"];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedSGD"];
    sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    knight = [[Knight alloc] initWithDictionary:sgd.knight];
    [knight setRandomName];
    //NSLog(@"Class: %@\nMorality: %@\nIntelligence: %@", knight.class, knight.morality, knight.intelligenceLvl);
    
    [self createLabelWithTapRecognizer:_classLabel labelText:[NSString stringWithFormat:@"Class: %@",[knight.class capitalizedString]]];
    [self  createLabelWithTapRecognizer:_moralityLabel labelText:[NSString stringWithFormat:@"Morality: %@",[knight.morality capitalizedString]]];
    [self createLabelWithTapRecognizer:_nameLabel labelText:[NSString stringWithFormat:@"Name: %@",knight.name]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateNameFromCustom:) name:@"customNameEntered" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateNameFromCustom:(NSNotification*)note{
    knight.name = note.object;
    _nameLabel.text = [NSString stringWithFormat:@"Name: %@",knight.name];
}

- (void)createLabelWithTapRecognizer:(UILabel*)label labelText:(NSString*)text{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped:)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    
    label.text = text;
    [label addGestureRecognizer:tapGestureRecognizer];
    label.userInteractionEnabled = YES;
}

- (void)labelTapped:(UITapGestureRecognizer*)tapRecognizer{
    UILabel* tappedLabel = (UILabel*)tapRecognizer.view;
    
    if([tappedLabel.text isEqualToString:_descriptionLabel.text]){
        [self hideDescriptionLabel];
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideDescriptionLabel) object:nil];
    }else if([tappedLabel.text isEqualToString:_classLabel.text]){
        [self presentDetailLabel:@"Class Details"];
    }else if([tappedLabel.text isEqualToString:_moralityLabel.text]){
        [self presentDetailLabel:@"Morality Details"];
    }else if([tappedLabel.text isEqualToString:_nameLabel.text]){
        UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [self dismissViewControllerAnimated:YES completion:nil];
                             }];
        UIAlertAction* newRandomName = [UIAlertAction
                             actionWithTitle:@"New Random Name"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [knight setRandomName];
                                 _nameLabel.text = [NSString stringWithFormat:@"Name: %@",knight.name];
                                 [self dismissViewControllerAnimated:YES completion:nil];
                            }];
        UIAlertAction* newCustomName = [UIAlertAction
                                  actionWithTitle:@"New Custom Name"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      [self dismissViewControllerAnimated:YES completion:nil];
                                      [Connector createNameTextAlertController:self title:@"New Name" message:@""];
                                      
                                  }];
        
        NSArray *actions = @[newRandomName,newCustomName,cancel];
        [Connector createCustomAlertController:self title:@"New Name?" message:@"Do you want to change your name?" actions:actions];
    }
    
    //NSLog(@"%@ Tapped",tappedLabel.text);
}

- (void)presentDetailLabel:(NSString*)message{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideDescriptionLabel) object:nil];
    _descriptionLabel.hidden = false;
    _descriptionLabel.enabled = true;
    
    [self createLabelWithTapRecognizer:_descriptionLabel labelText:message];
    [self performSelector:@selector(hideDescriptionLabel) withObject:nil afterDelay:5];
}

- (void)hideDescriptionLabel{
    _descriptionLabel.hidden = true;
    _descriptionLabel.enabled = false;
}

- (void)createNewGame {
    sgd.knight = [knight toDictionary];
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"gameSaved"];
    [[NSUserDefaults standardUserDefaults] setObject:[sgd toDictionary] forKey:@"savedGame"];

    NSLog(@"Create New Game");
}

- (void)popToRootView{
    [Connector createCancelAlertController:self title:@"Cancel Character Creation?" message:@"All data will be lost if cancelled"];
}

@end
