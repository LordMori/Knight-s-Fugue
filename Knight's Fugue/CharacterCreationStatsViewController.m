//
//  CharacterCreationStatsViewController.m
//  Knight's Fugue
//
//  Created by Marc Becker on 4/6/15.
//  Copyright (c) 2015 Marc Becker. All rights reserved.
//

#import "CharacterCreationStatsViewController.h"

@implementation CharacterCreationStatsViewController
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
    
    
    [self createLabelWithTapRecognizer:_strengthLabel labelText:[NSString stringWithFormat:@"Domination: %@",knight.strengthLvl]];
    [self  createLabelWithTapRecognizer:_dexterityLabel labelText:[NSString stringWithFormat:@"Cunning: %@",knight.dexterityLvl]];
    [self createLabelWithTapRecognizer:_intelligenceLabel labelText:[NSString stringWithFormat:@"Understanding: %@",knight.intelligenceLvl]];
    [self createLabelWithTapRecognizer:_healthLabel labelText:[NSString stringWithFormat:@"Vitality: %@",knight.healthLvl]];
    [self createLabelWithTapRecognizer:_willpowerLabel labelText:[NSString stringWithFormat:@"Persistence: %@",knight.willpowerLvl]];
    [self createLabelWithTapRecognizer:_perceptionLabel labelText:[NSString stringWithFormat:@"Judgement: %@",knight.perceptionLvl]];
    [self createLabelWithTapRecognizer:_hitPointsLabel labelText:[NSString stringWithFormat:@"Heart: %@",knight.hitpointsLvl]];
    [self  createLabelWithTapRecognizer:_fatiguePointsLabel labelText:[NSString stringWithFormat:@"Soul: %@",knight.fatigueLvl]];
    [self createLabelWithTapRecognizer:_basicSpeedLabel labelText:[NSString stringWithFormat:@"Reflexes: %@",knight.speedLvl]];
    [self createLabelWithTapRecognizer:_basicMoveLabel labelText:[NSString stringWithFormat:@"Movement: %@",knight.moveLvl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    }else if([tappedLabel.text isEqualToString:_strengthLabel.text]){
        [self presentDetailLabel:@"Strength Skill Details"];
    }else if([tappedLabel.text isEqualToString:_intelligenceLabel.text]){
        [self presentDetailLabel:@"Intelligence Skill Details"];
    }else if([tappedLabel.text isEqualToString:_dexterityLabel.text]){
        [self presentDetailLabel:@"Dexterity Skill Details"];
    }else if([tappedLabel.text isEqualToString:_willpowerLabel.text]){
        [self presentDetailLabel:@"Willpower Skill Details"];
    }else if([tappedLabel.text isEqualToString:_perceptionLabel.text]){
        [self presentDetailLabel:@"Perception Skill Details"];
    }else if([tappedLabel.text isEqualToString:_healthLabel.text]){
        [self presentDetailLabel:@"Health Skill Details"];
    }else if([tappedLabel.text isEqualToString:_hitPointsLabel.text]){
        [self presentDetailLabel:@"Hit Points Skill Details"];
    }else if([tappedLabel.text isEqualToString:_fatiguePointsLabel.text]){
        [self presentDetailLabel:@"Fatigue Skill Details"];
    }else if([tappedLabel.text isEqualToString:_basicMoveLabel.text]){
        [self presentDetailLabel:@"Basic Move Skill Details"];
    }else if([tappedLabel.text isEqualToString:_basicSpeedLabel.text]){
        [self presentDetailLabel:@"Basic Speed Skill Details"];
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
