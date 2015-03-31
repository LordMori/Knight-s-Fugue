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

- (void)viewDidLoad {
    [super viewDidLoad];
    [Connector customizeBarButton:_cancelUI_B];
    [Connector customizeBarButton:_createUI_B];
    
    [self hideDescriptionLabel];
    
    NSDictionary *sgdDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedGame"];
    SavedGameData *sgd = [[SavedGameData alloc] initWithDictionary:sgdDict];
    Knight *knight = [[Knight alloc] initWithDictionary:sgd.knight];
    //NSLog(@"Class: %@\nMorality: %@\nIntelligence: %@", knight.class, knight.morality, knight.intelligenceLvl);
    
    [self createLabelWithTapRecognizer:_classLabel labelText:[NSString stringWithFormat:@"Class: %@",[knight.class capitalizedString]]];
    [self  createLabelWithTapRecognizer:_moralityLabel labelText:[NSString stringWithFormat:@"Morality: %@",[knight.morality capitalizedString]]];
    [self createLabelWithTapRecognizer:_nameLabel labelText:[NSString stringWithFormat:@"Name: %@",knight.name]];
    [self createLabelWithTapRecognizer:_strengthLabel labelText:[NSString stringWithFormat:@"Strength: %@",knight.strengthLvl]];
    [self createLabelWithTapRecognizer:_intelligenceLabel labelText:[NSString stringWithFormat:@"Intelligence: %@",knight.intelligenceLvl]];
    [self createLabelWithTapRecognizer:_dexterityLabel labelText:[NSString stringWithFormat:@"Dexterity: %@",knight.dexterityLvl]];
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
    }else if([tappedLabel.text isEqualToString:_classLabel.text]){
        [self presentDetailLabel:@"Class Details"];
    }else if([tappedLabel.text isEqualToString:_moralityLabel.text]){
        [self presentDetailLabel:@"Morality Details"];
    }
    
    //NSLog(@"%@ Tapped",tappedLabel.text);
}

- (void)presentDetailLabel:(NSString*)message{
    _descriptionLabel.hidden = false;
    _descriptionLabel.enabled = true;
    
    [self createLabelWithTapRecognizer:_descriptionLabel labelText:message];
    [self performSelector:@selector(hideDescriptionLabel) withObject:nil afterDelay:5];
}

- (void)hideDescriptionLabel{
    _descriptionLabel.hidden = true;
    _descriptionLabel.enabled = false;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (IBAction)createUI_A:(id)sender {
}

- (IBAction)cancelUI_A:(id)sender {
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"cancelPressed"];
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}


@end
